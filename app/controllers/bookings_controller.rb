class BookingsController < ApplicationController
  before_action :set_room, only: [:new, :create, :edit, :show]
  
  def index
    @bookings = Booking.where(user: current_user)
    
  end

  def show
        @bookings = Booking.all

  end

  def new
        @booking = Booking.new

  end

    def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.room = @room
    @booking.user = current_user
    
  
    if @booking.save
      redirect_to bookings_path, success: "You have a successfully booked #{@room.name}"
    else
      flash[:alert] = "#{@booking.errors.first.last}"
      render :new
       
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_path, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  
  def booking_params
    params.require(:booking).permit(:valid_from, :valid_to, :participants)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def verify_if_admin_and_redirect_with_error_message_if_not 
    unless current_user.is_admin
    flash[:danger] = 'You are not authorized to perform that action' 
    redirect_to buildings_url
    end 
  end
 
  
end