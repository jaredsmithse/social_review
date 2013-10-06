class ChangeTypeColumnIn < ActiveRecord::Migration
  def change
  	remove_column :entities, :type
  end
end
