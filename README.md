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
| birth_year       | date   | null: false |
| birth_month      | date   | null: false |
| birth_day        | date   | null: false |
### Association
- has_many :items


## ITEM テーブル
| Column                     | Type   | Options     |
| ---------------------------| ------ | ----------- |
| name                       | string | null: false |
| item_image_id:             | string | null: false ,foreign_key: true|
| price                      | string | null: false |
| introduction               | string | null: false |
| seller_id                  | string | null: false ,foreign_key: true|
| category_id                | string | null: false ,foreign_key: true|
| item_condition_id          | string | null: false ,foreign_key: true|
| shipping_charge_id         | string | null: false ,foreign_key: true|
| shipping_region_id         | string | null: false ,foreign_key: true|
| estimated_shipping_date_id | string | null: false ,foreign_key: true|
| sold_out_id                | string | null: false ,foreign_key: true|
| users_id                   | string | null: false ,foreign_key: true|
### Association
- belongs_to :user


## Orders テーブル
| ---------------------------| ------ | ----------- |
| buyers_user_id             | string | null: false |
| item_id                    | string | null: false |
| items                      | string | null: false |
| security_code              | string | null: false |
### Association
- belongs_to :item


## DELIVERY テーブル
| ---------------------------| ------ | ----------- |
| postal_code                | string | null: false |
| prefecture_id              | string | null: false |
| city                       | string | null: false |
| address                    | string | null: false |
| building_name              | string |             | 
| phone_number               | string | null: false |
| orders_id                  | string | null: false |
### Association
- belongs_to :order


## CREDIT_CARD テーブル
| ---------------------------| ------ | ----------- |
| card_number                | string | null: false |
| explanation_month          | string | null: false |
| explanation_year           | string | null: false |
| security_code              | string | null: false |
### Association
- belongs_to :order