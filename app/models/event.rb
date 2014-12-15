class Event < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :taggings

  def self.tagged_with(name)
  	Tag.find_by_name!(name).events
  end
  
  def tag_list
  	tags.map(&:name).join(", ")
  end

  def tag_list=(names)
  	self.tags = names.split(",").map do |name|
  	  Tag.where(name: name.strip).first_or_create!
  	end
  end
end
