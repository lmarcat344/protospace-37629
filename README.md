# README
# テーブル設計

## Users Table

| Column             | Type   | Option                   |
|--------------------|--------|--------------------------|
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| profile            | text   | null: false              |
| occupation         | text   | null: false              |
| position           | text   | null: false              |

### Association

- has_many :prototypes
- has_many :comments

## Prototypes Table

| Column     | Type       | Option                         |
| ---------- |------------|--------------------------------|
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Asssociation

- belongs_to :users
- has_many   :comments

## Comments Table

| Column    | Type       | Opttion                        |
|-----------|------------|--------------------------------|
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

belongs_to :users
belongs_to :prototypes