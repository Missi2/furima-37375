# README

## Usersテーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :selects

## itemsテーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| explanatory   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :buyer
- has_one_attached :image
- belongs_to :select

## Commentsテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## buyersテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |

### Association
- belongs_to :item

## imagesテーブル(ActiveStorage)
| Column      | Type      | Option      |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| record_type | string    | null: false |
| record_id   | integer   | null: false |
| blob_id     | integer   | null: false |
| created_at  | timestamp | null: false |

### Association
- belongs_to :item

## selectsテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item