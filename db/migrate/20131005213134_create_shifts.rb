class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
    	t.datetime :start_time
    	t.datetime :end_time
    end
  end
end
