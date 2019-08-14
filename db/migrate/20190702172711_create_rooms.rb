class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :code
      t.string :floor
      t.integer :capacity
      t.integer :is_active, default: true
      t.belongs_to :building
      
      t.timestamps
    end
  end
end
