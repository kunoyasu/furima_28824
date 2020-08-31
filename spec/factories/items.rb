FactoryBot.define do
  factory :item do
    name { 'タオル' }
    introduction                { 'とても上品なタオルです。' }
    category_id                 { 2 }
    condition_id                { 2 }
    shipping_charge_id          { 2 }
    estimated_shipping_date_id  { 2 }
    shipping_region_id          { 2 }
    price                       { 5000 }
   
    association :user, factory: :user
  end
end
