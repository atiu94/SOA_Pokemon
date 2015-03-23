class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power_point
      t.integer :damage
      t.string :element

      t.timestamps null: false
    end
  end
end
