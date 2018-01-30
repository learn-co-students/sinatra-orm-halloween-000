class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |k|
      k.string :name
      k.integer :age
      k.string :feeling
    end
  end
end
