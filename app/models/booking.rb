# frozen_string_literal: true

class Booking < ApplicationRecord
  paginates_per 10

  
  belongs_to :user
  belongs_to :room

  validate :valid_from_greater_than_valid_to
  validates :user_id, :valid_to, :valid_from, presence: true
  #validate :booking_available
  #validate :capacity
  validates :valid_from, :valid_to, :overlap => {:scope => "room_id"}

  scope :time_lapse, lambda {|time = Time.now| where("valid_from <= ? AND valid_to >= ?", time, time) }
  scope :range_for_free_rooms, lambda {|time = Time.now| where("valid_to <= ?", time) }


  def valid_from_greater_than_valid_to

    if Date.today > valid_to.to_date
      errors.add(:valid_to, "check in date should be greater or equal to today's date")
    # valid_from should be greater than valid_to
    elsif valid_from.to_date > valid_to.to_date
      errors.add(:valid_from, "check out date should be greater than Check in Date")
    end
  end

  def capacity
    if self.participants && self.participants > room.capacity  
      errors.add(:booking, "The number of participants exceeds the capacity of the room")
    end
  end


end
