class Creature < ActiveRecord::Base

	has_many :creature_locations
	TYPES = ["Fire", "Water", "Grass"]

	validates :element, presence: true, inclusion: { in: TYPES }
	validates :name, presence: true
	validates :description
	validates :hit_point, presence: true, numericality: true
	
end
