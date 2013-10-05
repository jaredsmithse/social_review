class Employee < ActiveRecord::Base
	has_many :shifts, through: :employeeshifts
	belongs_to :user
end