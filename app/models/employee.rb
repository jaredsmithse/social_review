require 'csv'

class Employee < ActiveRecord::Base
	has_and_belongs_to_many :shifts
	belongs_to :user

	def self.build_report(user_id)
		CSV.open("./public/users/data.csv", "wb") do |csv|
  		Employee.where(user_id: user_id).each do |employee|
  			csv << [employee.name, employee.reviews.where(sentiment: "positive").count, employee.reviews.where(sentiment: "negative").count, employee.reviews.where(sentiment: "neutral").count]
  		end
		end
	end
end