# テーブル設計
## usersテーブル

|Column|Type|Options|
|------|---|---|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|encrypted_password|string|null:false|
|last_name|string|null:false|
|first_name|string|null:false|
|kana_first_name|string|null:false|
|kana_last_name|string|null:false|
|birthday|date|null:false|

### Association

- has_many :items
- has_many :orders

## items テーブル
|Column|Type|Options|
|------|---|---|
|user|references|null:false,foreign_key:true|
|name|string|null:false|
|explain|text|null:false|
|category_id|integer|null:false|
|state_id|integer|null:false|
|burden_id|integer|null:false|
|area_id|integer|null:false|
|delivery|integer|null:false|
|price|integer|null:false|

### Association
- belongs_to:user
- has_one:order

## buyersテーブル
|Column|Type|Options|
|----|-----|---|
|user|references|null:false,foreign_key:true|
|item|references|null:false,foreign_key:true|

### Association
- has_one:address
- belongs_to:user
- belongs_to:item

## addressesテーブル
|Columns|Type|Options|
|---|--|--|
|postal_code|string|null:false|
|phone_number|string|null:false|
|buyer|references|null:false foreign_key:true|
|city|string|null:false|
|building|string||
|address_line|string|null:false|
|area_id|integer|null:false|

### Association
- belongs_to:order