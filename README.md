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


## ITEM テーブル
| Column                     | Type   | Options     |
| ---------------------------| ------ | ----------- |
| name                       | string | null: false |
| item_image_id:             | string | null: false ,foreign_key: true|
| price                      | string | null: false |
| introduction               | string | null: false |
| user_id                    | references | null: false ,foreign_key: true|
| category_id                | string | null: false ,foreign_key: true|
| item_condition_id          | string | null: false ,foreign_key: true|
| shipping_charge_id         | string | null: false ,foreign_key: true|
| shipping_region_id         | string | null: false ,foreign_key: true|
| estimated_shipping_date_id | string | null: false ,foreign_key: true|
| sold_out_id                | string | null: false ,foreign_key: true|
### Association
- belongs_to :users , items
- has_one:orders 


## Orders テーブル
| ---------------------------| -----------| -------------------------------|
| user_id                    | references | null: false ,foreign_key: true |
| item_id                    | references | null: false ,foreign_key: true |

### Association
- belongs_to :item,users
- has_one    :delivery

## DELIVERY テーブル
| ---------------------------| ------ | ----------- |
| postal_code                | string | null: false |
| prefecture_id              | string | null: false |
| city                       | string | null: false |
| address                    | string | null: false |
| building_name              | string |             | 
| phone_number               | string | null: false |
| order_id                   | string | null: false |
### Association
- belongs_to :orders