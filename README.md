# README

<!-- ## アプリ名
Mybook

## アプリ説明
購入した本を管理するアプリ

## 企画背景
本をよく買うので購入した本を自己管理できるようなアプリがあれば便利だと思い企画しました。 -->

<!-- ## 本番環境
<a href="https://task-app-3.herokuapp.com/">https://task-app-3.herokuapp.com/</a> -->

<!-- - テストアカウント<br>
Eメール：tttt@gmail.com<br>
パスワード：tttttt

## 使い方
- ユーザー登録を行う
- 「New work」ボタンより新規作業(タスク)を登録
- 「新規予定」ボタンより新規スケジュールを登録 -->

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|integer|null: false|

### Association
- has_many :book

## bookテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|author|string|null: false|
|genre|string|null: false|
|title|string|null: false|
|image|string|
|buyday|string|
|other|string|
|user_id|integer|null: false|

### Association
- belogs_to user




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
