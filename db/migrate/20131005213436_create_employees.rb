class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
    	t.string :name
    	t.string :company
    	t.integer :user_id
    end
  end
end
