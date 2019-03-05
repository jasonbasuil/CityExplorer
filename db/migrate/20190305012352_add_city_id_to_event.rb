class AddCityIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :city_id, :integer
  end
end
