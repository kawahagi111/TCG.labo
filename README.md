# アプリケーション名

 - TCG.labo

# アプリケーション概要

 - カードゲーム専用の掲示板アプリ

# テスト用アカウント
 - Basic認証のID、PASS
 - ID,admin
 - PASS,2222

 - テスト用アカウント
 - メールアドレス,aaa@aaaa
 - パスワード,aaaaa1

 # 利用方法
  - デッキを撮りツイートをしデッキを共有してコメントなどをする
  
 # 目指した課題解決
  - コロナ禍で自宅で出来る遊びとしてカードゲームを始めようとしている人が、まずどんなデッキがあってどれくらいの値段で揃うのか分からなかったこの課題を解決したかった

 # 洗う出した要件
 
 # 実装した機能
 - ログイン機能




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
