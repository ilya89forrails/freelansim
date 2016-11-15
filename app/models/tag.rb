class Tag < ApplicationRecord
	has_many :taggings
	has_many :projects, through: :taggings

	has_many :tag_user_connections
	has_many :users, through: :tag_user_connections

	has_many :tag_service_connections
	has_many :services, through: :tag_service_connections


end
