# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| read_last          | string  | null: false |
| read_first         | string  | null: false |
| birth              | integer | null: false |

### Association

- has_many :items
- has_many :buyers
- belongs_to_active_hash :birth

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| price            | string     | null: false |
| text             | string     | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| postage_type     | integer    | null: false |
| prefecture       | integer    | null: false |
| preparation_days | integer    | null: false |
| user             | references | null: false |

### Association

- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_type
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :preparation_days

## buyer テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefecture  | integer    | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
|telephone    | string     | null: false |
| user        | references | null: false |

### Association

- belongs_to :user
- has_many :items
- belongs_to_active_hash :prefecture