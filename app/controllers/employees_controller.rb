class EmployeesController < ApplicationController
  before_filter :authenticate_user!

  def new
  	parse_employee_data(params['name'], params['date'], params['from'], params['to'])
  	@user = current_user
  	render 'employees/_employees', layout: false
  end

  def parse_employee_data(name, date, from, to)
		shift = Shift.new()
		employee = Employee.find_or_create_by_name(name)
		puts "CHECKPOINT ONE"
		current_user.employees << employee
		shift.start_time = from
		shift.end_time = to
		puts "CHECKPOINT TWO"
		employee.shifts << shift
		employee.save
		shift.save
		puts "CHECKPOINT THREEE"
	end

end
