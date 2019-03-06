class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.date :date
      t.time :time
      t.text :description
      t.integer :host_id
      t.integer :city_id

      t.timestamps
    end
  end
end
