class Project < ApplicationRecord
	has_many :comments
	has_many :taggings
	has_many :tags, through: :taggings

	#include Elasticsearch::Model
	#include Elasticsearch::Model::Callbacks

	#def self.search(params)
  	#	tire.search(load: true) do
    #		query { string params[:query], default_operator: "AND" } if params[:query].present?
    #		filter :range, published_at: {lte: Time.zone.now}
  	#	end
	#end


	def self.search(search)
  	  if search
        where("title like :q or description like :q", q: "%#{search}%")
      else
        Project.all
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
