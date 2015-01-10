class Creature < ActiveRecord::Base

	validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
	validates :desc, :presence => true, :uniqueness => {:case_sensitive => false}

end
