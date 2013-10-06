class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
    	t.string :type
    	t.string :relevance
    	t.string :sentiment
    	t.string :text
    	t.integer :review_id
    end
  end
end
