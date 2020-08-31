class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :user
  has_one    :delivery
  belongs_to_active_hash :shipping_region
end
