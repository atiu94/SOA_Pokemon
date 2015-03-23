class UserCreatureMove < ActiveRecord::Base

	belongs_to :user_creature
	belongs_to :move 

end
