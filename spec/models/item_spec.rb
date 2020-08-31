require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('img/example.png', 'img/png')
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'image、name、introduction、category_id、condition_id、shipping_charge_id、estimated_shipping_date_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductionが空だと登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @item.category_id = ''

        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end

      it 'shipping_charge_idが空だと登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge is not a number')
      end

      it 'estimated_shipping_date_idが空だと登録できない' do
        @item.estimated_shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated shipping date is not a number')
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格(price)の範囲が、¥300未満だと登録できない。' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は¥300~¥9,999,999の範囲で設定してください。')
      end

      it '価格(price)の範囲が、¥9,999,999より高いと登録できない。' do
        @item.price = 100_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は¥300~¥9,999,999の範囲で設定してください。')
      end
    end
  end
end
