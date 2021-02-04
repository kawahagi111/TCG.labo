# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | null: false |
| nicname  | string | null: false |

### Association

- has_many :tweets
- has_many :comments
- has_many :likes

## tweets テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| concept    | text       | null: false                    |

### Association

- has_many :comments
- belongs_to :user
- has_many :likes


## messages テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     |                                |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |


### Association

- belongs_to :tweet
- belongs_to :user

## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |


### Association

- belongs_to :tweet
- belongs_to :user