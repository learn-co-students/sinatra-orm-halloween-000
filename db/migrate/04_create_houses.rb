class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |h|
      h.string :address
    end
  end
end
