class EmployeesController < ApplicationController
  before_filter :authenticate_user!

  def new
  	parse_employee_data(params['name'], params['date'], params['from'], params['to'])
  	@user = current_user
  	Employee.build_report(@user.id)
  	render 'employees/_employees', layout: false
  end

  def charts
  	render :charts
  end

  def parse_employee_data(name, date, from, to)
		shift = Shift.new()
		employee = Employee.find_or_create_by_name(name)
		puts "CHECKPOINT ONE"
		current_user.employees << employee
		shift.start_time = date + " " + from
		shift.end_time = date + " " + to
		puts "CHECKPOINT TWO"
		employee.shifts << shift
		employee.save
		shift.save
		puts "CHECKPOINT THREEE"
	end

end
