FactoryBot.define do
  factory :order_delivery do
    token                       { '123456aerfdscdfre3'}
    postal_code                 { '123-4567' }
    shipping_region_id          { 2 }
    city                        { '名古屋市' }
    address                     { '名古屋駅1-12-2' }
    phone_number                { 12345678912 }
  end
end
