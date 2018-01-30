class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |b|
      b.integer :kid_id
    end
  end
end
