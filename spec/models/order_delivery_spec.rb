require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
end

describe OrderDelivery do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@order_delivery).to be_valid
  end 

  it 'カードトークンが無いと保存できないこと' do
    @order_delivery.token = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
  end

  it 'postal_codeが空だと保存できないこと' do
    @order_delivery.postal_code = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeにハイフンがないと保存できないこと' do
    @order_delivery.postal_code = including '-'
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include('Postal code is invalid')
  end

  it 'shipping_region_idが空だと登録できない' do
    @order_delivery.shipping_region_id = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Shipping region can't be blank")
  end

  it 'cityが空だと登録できない' do
    @order_delivery.city = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("City can't be blank")
  end

  it 'addressが空だと登録できない' do
    @order_delivery.address = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_numberが空だと登録できない' do
    @order_delivery.phone_number = nil
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
  end
  
  it'phone_numberがハイフンありだと登録できない' do 
    @order_delivery.phone_number = including '-'
    @order_delivery.valid?
    expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
  end
end
