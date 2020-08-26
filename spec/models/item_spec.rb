require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Item do
    before do
     @item = FactoryBot.build(:item)
     @item.image = fixture_file_upload("img/example.png", 'img/png')
    end


    # ./spec/models/item_spec.rb:10:in `block (2 levels) in <top (required)>'

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'image、name、introduction、category_id、condition_id、shipping_charge_id、estimated_shipping_date_id、priceが存在すれば登録できる' do
      expect(@item).to be_valid
      end

    end



   context '新規登録がうまくいかないとき' do
     it 'imageが空だと登録できない' do
      @item.image = ''
      @item.valid?
      expect(@item.image.errors.full_messages).to include("Image can't be blank")
      
     end

     it 'nameが空だと登録できない' do
       @item.name = ''
       @item.valid?
    
       expect(@item.name.errors.full_messages).to include("Name can't be blank")
     end

     it 'introductionが空だと登録できない' do
       @item.introduction = ''
       @item.valid?
       expect(@item.introduction.errors.full_messages).to include("Introduction can't be blank")
     end


     it 'category_idが空だと登録できない' do
       @item.category_id = ''
       @item.valid?
       expect(@item.category_id.errors.full_messages).to include("Category must be other than 1")
     end

     it 'condition_idが空だと登録できない' do
       @item.condition_id = ''
      
       @item.valid?
       expect(@item.condition_id.errors.full_messages).to include("Condition must be other than 1")
     end

  
     it 'shipping_charge_idが空だと登録できない' do
       @item.shipping_charge_id = ''
       @item.valid?
       expect(@item.shipping_charge_id.errors.full_messages).to include("Shipping charge must be other than 1")
     end


     it 'estimated_shipping_date_idが空だと登録できない' do
       @item.estimated_shipping_date_id = ''
       @item.valid?
       expect(@item.estimated_shipping_date_id.errors.full_messages).to include("Estimated shipping date must be other than 1")
     end
  
      it 'priceが空だと登録できない' do
       @item.price = ''
       @item.valid?
       expect(@item.price.errors.full_messages).to include("Price can't be blank")
      end
      
      it '価格(price)の範囲が、¥300未満だと登録できない。' do
        @item.price < 300 
        expect(@item.price.errors.full_messages).to be_valid
       end
       
       it '価格(price)の範囲が、¥9,999,999より高いと登録できない。' do
        @item.price > 9999999 
        expect(@item.price.errors.full_messages).to be_valid
       end
 
   end
 end
end
  
  

