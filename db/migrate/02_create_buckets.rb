class CreateBuckets < ActiveRecord::Migration
  def change
    # create table here
    create_table :buckets do |t|
    	t.belongs_to :kid
    end
  end
end