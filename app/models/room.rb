# frozen_string_literal: true

class Room < ApplicationRecord
  has_one :building

  has_many :roomgoods
  has_many :goods, through: :roomgoods

  has_many :bookings
  has_many :users, through: :bookings
  paginates_per 10


  def self.api(code_room)
    conn = Faraday.new(url: 'https://ca-3-api.mybluemix.net/api/v1/rooms/' + code_room)
    response = conn.get
    data = JSON.parse response.body
  end


  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

 def self.free(time = Time.now)
    booking_room_ids = Booking.time_lapse(time).pluck(:room_id)
    where('id NOT IN (?)', booking_room_ids)
  end

  def self.booked(time = Time.now)
    booking_room_ids = Booking.time_lapse(time).pluck(:room_id)
    where(:id => booking_room_ids)
  end

end

