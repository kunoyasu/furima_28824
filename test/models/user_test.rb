require 'test_helper'

# #テスト環境のため構築。
require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.nickname = '' # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.email = '' # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
