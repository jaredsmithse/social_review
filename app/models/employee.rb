require 'csv'

class Employee < ActiveRecord::Base
	has_and_belongs_to_many :shifts
	belongs_to :user

	def self.build_report(user_id)
		employees = Employee.where(user_id: user_id)
		employee_info = Hash.new(Hash.new())


		Review.where(user_id: user_id).each do |review|
			employees.each do |employee|
				employee.shifts.each do |shift|
					review_time = Time.at(review.date.to_i)
					if  review_time > shift.start_time && review_time < shift.end_time
						employee_info[employee][review.sentiment] += 1
					end
				end
			end
		end
		

		CSV.open("./public/users/data.csv", "wb") do |csv|
			csv << ["Name", "Positive Reviews", "Negative Reviews", "Neutral Reviews"]
			employee_info.each do |employee, data|
				csv << [employee.name, data['positive'], data['negative'], data['neutral']]
			end
		end
	end
end