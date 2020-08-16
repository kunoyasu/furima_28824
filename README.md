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
- has_many :items 
- has_many :orders


## ITEMS テーブル
| Column                     | Type   | Options     |
| ---------------------------| ------ | ----------- |
| name                       | string | null: false |
| image　　　                 | string | null: false |
| price                      | integer| null: false |
| introduction               | text   | null: false |
| user                       | references | null: false , foreign_key: true|
| category_id                | integer | null: false |
| condition_id               | integer | null: false |
| shipping_charge_id         | integer | null: false |
| shipping_region_id         | integer | null: false |
| estimated_shipping_date_id | integer | null: false |
### Association
- belongs_to :user
- has_one:order


## Orders テーブル
| ---------------------------| -----------| -------------------------------|
| user                       | references | null: false ,foreign_key: true |
| item   　　                 | references | null: false ,foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one    :delivery


## DELIVERY テーブル
| ---------------------------| ------  | ----------- |
| postal_code                | string  | null: false |
| prefecture_id              | integer | null: false |
| city                       | string  | null: false |
| address                    | string  | null: false |
| building_name              | string  | 　　　　　 　 | 
| phone_number               | string  | null: false |
| order                      | references | null: false,foreign_key: true|
### Association
- belongs_to :order