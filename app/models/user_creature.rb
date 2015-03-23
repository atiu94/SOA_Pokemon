class UserCreature < ActiveRecord::Base

	belongs_to :user 
	has_many :user_creature_moves
	
end
