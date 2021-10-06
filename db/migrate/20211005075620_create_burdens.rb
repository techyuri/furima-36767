class CreateBurdens < ActiveRecord::Migration[6.0]
  def change
    create_table :burdens do |t|

      t.timestamps
    end
  end
end
