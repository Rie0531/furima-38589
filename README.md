# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| read_last          | string  | null: false              |
| read_first         | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :items
- has_many :historys
- belongs_to_active_hash :birthday
## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| postage_type_id    | integer    | null: false |
| prefecture_id      | integer    | null: false |
| preparation_day_id | integer    | null: false |
| user               | references | null: false |
 
### Association

- belongs_to :user
- belongs_to :history
- belongs_to_active_hash :category_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :postage_type_id
- belongs_to_active_hash :prefectures_id
- belongs_to_active_hash :preparation_day_id

## historys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| shipping_data | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_data

## shipping_datas テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| telephone     | string     | null: false                    |
| history       | references | null: false, foreign_key: true |

### Association

- belongs_to :history
- belongs_to_active_hash :prefectures_id