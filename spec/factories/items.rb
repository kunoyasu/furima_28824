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
    # image { File.open("#{Rails.root}/app/assets/images/test.jpg") }
    #  image { fixture_file_upload("#{Rails.root}/spec/image/test.jpg", 'img/png') }
    #  image { fixture_file_upload("#{Rails.root}/spec/fixtures/img/example.png", 'img/png') }
    # userアソシエーション
    association :user, factory: :user
  end
end
