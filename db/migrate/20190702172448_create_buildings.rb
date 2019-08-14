class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :adress
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6

      t.timestamps
    end
  end
end
