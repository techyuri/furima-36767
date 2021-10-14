class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
        create_table :addresses do |t|
    
         t.integer :area_id 
         t.string :city
         t.string :address_line
         t.string :building
         t.string :phone_number
         t.string :postal_code
         t.references :buyer, foreign_key: true
         t.timestamps
    end
  end
end
