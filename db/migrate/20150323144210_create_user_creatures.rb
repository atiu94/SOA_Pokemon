class CreateUserCreatures < ActiveRecord::Migration
  def change
    create_table :user_creatures do |t|
      t.integer :user_id
      t.integer :creature_id
      t.string :nickname
      t.integer :level
      t.integer :experience_points

      t.timestamps null: false
    end
  end
end
