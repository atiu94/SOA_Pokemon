class CreateCreatureLocations < ActiveRecord::Migration
  def change
    create_table :creature_locations do |t|
      t.integer :location_id
      t.integer :creature_id

      t.timestamps null: false
    end
  end
end
