class Employee < ActiveRecord::Base
	has_many :shifts, through: :employeeshifts
end