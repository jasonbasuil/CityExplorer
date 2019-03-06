class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.text :information

      t.timestamps
    end
  end
end
