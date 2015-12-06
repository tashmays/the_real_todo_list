class List < ActiveRecord::Base
	has_many :items, dependent: :destroy #best practice so it deletes id's associated with lists
	validates_presence_of :name, message: "Yo, man your name cannot be blank!" #first validation
	before_validation :set_name

	private
		def set_name
			self.name = 'Default Name' unless self.name
		end
end

