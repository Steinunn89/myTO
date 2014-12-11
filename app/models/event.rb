class Event < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
  	Tag.find_by_name!(name).articles
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
