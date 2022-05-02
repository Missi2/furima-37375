# README

## Usersテーブル

| Column             | Type     | Option                           |
| ------------------ | -------- | -------------------------------- |
| email              | string   | null: false, unique: true        |
| encrypted_password | string   | null: false, /\A[a-zA-Z0-9]+\z/  |
| nickname           | string   | null: false                      |
| name               | string   | null: false, /\A[ぁ-んァ-ン一-龥]/ |
| kana               | string   | null: false, /\A[ァ-ヶー－]+\z/   |
| birthday           | datetime | null: false                      |

### Association
- has_many :items
- has_many :comments

## itemsテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| explanatory | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| delivery    | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :buys
- has_one_attached :image

## Commentsテーブル
| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## buysテーブル
| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| condition | string     | null: false                    |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :item

## imagesテーブル(ActiveStorage)
| Column      | Type     | Option      |
| ----------- | -------- | ----------- |
| name        | string   | null: false |
| record_type | string   | null: false |
| record_id   | integer  | null: false |
| blob_id     | integer  | null: false |
| created_at  | datetime | null: false |

### Association
- belongs_to :item
