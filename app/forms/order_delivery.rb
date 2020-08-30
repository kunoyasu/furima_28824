class OrderDelivery
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_region_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    # 電話番号(半角数字、ハイフンなし,11桁以内）
    validates :phone_number, format: { with: /\A[0-9]+$\z/ }, length: { maximum: 11 }
  end

  def save
    # オーダー情報を保存し、「order」という変数にいれている。
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配達先の情報を保存する。
    Delivery.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, address: address, phone_number: phone_number, order_id: order.id)
  end
end
