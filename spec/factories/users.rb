FactoryBot.define do
  factory :user do
    email                 { 'abe@yahoo.co.jp' }
    nickname              { 'abe' }
    family_name           { '安倍' }
    last_name             { '隆' }
    family_name_kana { 'アベ' }
    last_name_kana        { 'タカシ' }
    password              { '00000000' }
    password_confirmation { '00000000' }
    birthday              { '1662-02-11' }
  end
end
