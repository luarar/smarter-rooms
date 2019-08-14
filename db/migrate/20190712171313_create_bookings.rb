# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :participants
      t.datetime :valid_to
      t.datetime :valid_from

      t.timestamps
    end
  end
end
