class CreateUserCreatureMoves < ActiveRecord::Migration
  def change
    create_table :user_creature_moves do |t|
      t.integer :user_creature_id
      t.integer :move_id

      t.timestamps null: false
    end
  end
end
