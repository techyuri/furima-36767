class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null:false
      t.integer :price,         null:false 
      t.references :user,       null:false, foreign_key: true
      t.text :explain,          null:false
      t.integer :category_id,   null:false
      t.integer :state_id,     null:false
      t.integer :burden_id,     null:false
      t.integer :delivery_id,   null:false
      t.integer :area_id, null:false
      t.timestamps
    end
  end
end
