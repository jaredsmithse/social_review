class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.string :provider
    	t.text :body
    	t.string :date
    	t.string :sentiment
    	t.integer :likes
    	t.integer :user_id
    end
  end
end
