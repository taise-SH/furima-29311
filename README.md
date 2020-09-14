# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------  | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kata  | string  | null: false |
| first_anme_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type     | Options                        |
| ------------- | -------- | ------------------------------ |  
| user          | string   | null: false, foreign_key: true |
| name          | string   | null: false                    |
| explanation   | string   | null: false                    |
| category      | integer  | null: false                    |
| condition     | integer  | null: false                    |
| postage_payer | integer  | null: false                    |
| prefecture    | integer  | null: false                    |
| delivery_day  | integer  | null: false                    |
| price         | integer  | null: false                    |

### Association

- belongs_to :user
- has_one    :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :addresse

## addresses テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| prefecture    | integer     | null: false                    |
| city          | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      | null: false                    |
| purchase      | references  | null: false, foreign_key: true |

### Association

- belongs_to :purchase