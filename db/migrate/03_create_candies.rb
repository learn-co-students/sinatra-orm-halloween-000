class CreateCandies < ActiveRecord::Migration
  def change
    # create table here
    create_table :candies do |t|
    	t.string :name
    	t.integer :pieces
    	t.integer :size
    	t.belongs_to :house
    	t.belongs_to :bucket
    end
  end
end