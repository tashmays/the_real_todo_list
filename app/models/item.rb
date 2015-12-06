class Item < ActiveRecord::Base
	belongs_to :list
	validates_presence_of :list_id, :name, :description
	validates_uniqueness_of :name
	validates_inclusion_of :priority, in:[1,2,3,4,5], message: 'Needs to be 1 - 5'
	serialize :tags
end
