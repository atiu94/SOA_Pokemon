class CreateCreatures < ActiveRecord::Migration
  def change
    create_table :creatures do |t|
      t.string :name
      t.string :element
      t.text :description
      t.integer :hit_point

      t.timestamps null: false
    end
  end
end
