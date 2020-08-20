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
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    validates :family_name, with: VALID_NAME_REGEX
    validates :last_name, with: VALID_NAME_REGEX
    # ユーザー本名のフリガナは全角（カタカナ）
    VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_kana, with: VALID_NAME_KANA_REGEX
    validates :last_name_kana, with: VALID_NAME_KANA_REGEX

    validates :birthday
    # パスワード半角英数字混合で6文字以上に設定。
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end
