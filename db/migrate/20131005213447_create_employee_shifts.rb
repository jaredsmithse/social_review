class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employee_shifts do |t|
    	t.references :employees
    	t.references :shifts
    end
  end
end
