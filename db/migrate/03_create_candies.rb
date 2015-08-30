class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
    	t.belongs_to :house
    	t.belongs_to :bucket
    	t.string :name
    	t.integer :pieces
    	t.integer :size
    end
  end
end