class Review < ActiveRecord::Base
	belongs_to :user
	has_many :entities
end