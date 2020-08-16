# テーブル設計

## USERS テーブル
| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false ,unique: true |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birth_day        | date   | null: false |
### Association
- has_many :items , orders


## ITEMS テーブル
| Column                     | Type   | Options     |
| ---------------------------| ------ | ----------- |
| name                       | string | null: false |
| item_image:                | string | null: false |
| price                      | integer| null: false |
| introduction               | string | null: false |
| user           　          | references | null: false ,foreign_key: true|
| category_id                | integer | null: false |
| item_condition_id          | integer | null: false |
| shipping_charge_id         | integer | null: false |
| shipping_region_id         | integer | null: false |
| estimated_shipping_date_id | integer | null: false |
| sold_out_id                | integer | null: false |
### Association
- belongs_to :user
- has_one:order


## Orders テーブル
| ---------------------------| -----------| -------------------------------|
| user                       | references | null: false ,foreign_key: true |
| item   　　                 | references | null: false ,foreign_key: true |
### Association
- belongs_to :item,user
- has_one    :delivery

## DELIVERY テーブル
| ---------------------------| ------  | ----------- |
| postal_code                | integer | null: false |
| prefecture_id              | integer | null: false |
| city                       | string  | null: false |
| address                    | integer | null: false |
| building_name              | string  | 　　　　　 　 | 
| phone_number               | integer | null: false |
| order                      | references | null: false,foreign_key: true|
### Association
- belongs_to :order