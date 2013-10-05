class AddVenueIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :venue_id, :string
  end
end
