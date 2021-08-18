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

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| kananame           | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column        | Type          | Options           |
| ------------  | ------------- | ----------------- |
| title         | string        | null: false       |
| explanation   | text          | null: false       |
| category      | text          | null: false       |
| status        | string        | null: false       |
| image         | ActiveStorage | null: false       |
| delivery_fee  | string        | null: false       |
| listing_area  | string        | null: false       |
| delivery_days | string        | null: false       |
| price         | integer       | null: false       |
| commission    | string        | null: false       |
| profit        | integer       | null: false       |
| user_id       | references    | foreign_key: true |


### Association
- belongs_to :users
- belongs_to :buyers

## buyers テーブル

| Column    | Type       | Options            |
| --------- | ---------- | --------------------- |
| user_id   | references | foreign_key: true  |
| item_id   | references | foreign_key: true  |

### Association

- belongs_to :users
- has_many :items
- has_one :shippings

## shippings テーブル

| Column       | Type    | Options      |
| ------------ | ------- | ------------ |
| postal_code  | integer | null: false  |
| prefecture   | string  | null: false  |
| city         | string  | null: false  |
| address      | string  | null: false  |
| building     | string  |              |
| telephone    | integer | null: false  |

- has_one :buyers