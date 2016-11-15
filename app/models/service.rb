class Service < ApplicationRecord
	belongs_to :user
	
	has_many :tag_service_connections
	has_many :tags, through: :tag_service_connections

	def self.search(search)
  	  if search
        where("title like :q or description like :q", q: "%#{search}%")
      else
        Service.all
      end
	end


	def tag_list
	  self.tags.collect do |tag|
	    tag.name
	  end.join(", ")
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  		new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  		self.tags = new_or_found_tags
	end
	
end
