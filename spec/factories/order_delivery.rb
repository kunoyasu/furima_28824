FactoryBot.define do
  factory :order_delivery do
    postal_code                 { '123-4567' }
    shipping_region_id          { 2 }
    city                        { '名古屋市' }
    address                     { '名古屋駅1-12-2' }
    phone_number                { 12_345_678_912 }
  end
end
