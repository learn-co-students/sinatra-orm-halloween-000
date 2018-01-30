class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |c|
      c.string :name
      c.integer :pieces
      c.integer :size
      c.integer :house_id
      c.integer :bucket_id
    end 
  end
end
