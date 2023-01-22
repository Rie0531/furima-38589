# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| read_last          | string  | null: false              |
| read_first         | string  | null: false              |
| birth_id           | date    | null: false              |

### Association

- has_many :purchases
- has_many :items
- has_many :buyers
- belongs_to_active_hash :birth_id

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

- has_many :purchases
- belongs_to :user
- belongs_to_active_hash :category_id
- belongs_to_active_hash :condition_id
- belongs_to_active_hash :postage_type_id
- belongs_to_active_hash :prefectures_id
- belongs_to_active_hash :preparation_day_id

## purchases テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| item_id | references | null: false |
| user_id | references | null: false |

### Association

- belongs_to :user
- belongs_to :item

## shipping_datas テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     |             |
| telephone     | string     | null: false |
| user          | references | null: false |
| item          | references | null: false |
### Association

- belongs_to :user
- belongs_to_active_hash :prefecture_id