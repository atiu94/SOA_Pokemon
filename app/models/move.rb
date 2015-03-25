class Move < ActiveRecord::Base

	has_many :user_creature_moves
	
	TYPES = ["Fire", "Water", "Grass"]

	validates :element, presence: true, inclusion: { in: TYPES }
	validates :name, presence: true
	validates :power_point, presence: true, numericality: true
	validates :damage, presence: true, numericality: true

end
