class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # メールアドレスのデータベース保存前に小文字にする。
  before_save { self.email = email.downcase }

  # 全ての入力項目を必須入力に設定
  with_options presence: true do
    validates :nickname
    # メールフォーマットの検証(”@”が入っているかの確認)と一意性の検証
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    # ユーザー本名は全角
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # ユーザー本名のフリガナは全角（カタカナ）
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
    # パスワード半角英数字混合で6文字以上に設定。
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, length: { minimum: 6 }, message: 'には英字と数字の両方を含めて設定してください'
  end
end
