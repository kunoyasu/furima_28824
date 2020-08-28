class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :estimated_shipping_date

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_region_id
    validates :estimated_shipping_date_id
  end

  # 価格の設定 ¥300~¥9,999,999の範囲で価格設定するようにする。
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999, allow_blank: true, message: '価格は¥300~¥9,999,999の範囲で設定してください。' }
end
