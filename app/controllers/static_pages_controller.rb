class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user, only: %i[home contact]
  before_action :authorize, only: %i[statics]
  def home; end

  def contact

  end

def statics
	
    @topfiveusers = User.includes(:bookings)
    .group("bookings.user_id")
    .pluck("users.name, count(bookings.id)")
    .first(5).last(30.days)
    
    @topfiverooms = Room.includes(:bookings)
    .group("bookings.room_id")
    .pluck("rooms.name, count(bookings.id)")
    .first(5).last(30.days)

  end
 
 
end
