class Creature < ActiveRecord::Base

	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
	validates :desc, :presence => true, length: {minimum: 2, maximum: 255}

end
