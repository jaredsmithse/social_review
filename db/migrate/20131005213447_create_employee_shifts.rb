class CreateEmployeeShifts < ActiveRecord::Migration
  def change
    create_table :employees_shifts do |t|
    	t.integer :employee_id
    	t.integer :shift_id
    end
  end
end
