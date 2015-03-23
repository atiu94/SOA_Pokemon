class Move < ActiveRecord::Base

	has_many :user_creature_moves
	
end
