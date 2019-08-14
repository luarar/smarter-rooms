class CreateRoomgoods < ActiveRecord::Migration[5.2]
  def change
    create_table :roomgoods do |t|
      t.references :room, foreign_key: true
      t.references :good, foreign_key: true

      t.timestamps
    end
  end
end
