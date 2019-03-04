class CreateUserCities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cities do |t|

      t.timestamps
    end
  end
end
