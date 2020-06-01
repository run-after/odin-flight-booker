class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_of_pass = params[:num_of_pass].to_i
    @booking = Booking.new
    @num_of_pass.times do
      @booking.passengers.build
    end
  end

  def create
    @flight = Flight.find(params[:booking][:flight_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      PassengerMailer.with(booking: @booking).thank_you_email.deliver_now
      redirect_to booking_path(@booking)
    else
      flash[:danger] = @booking.errors.full_messages
      render :new
    end
    
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes:[:name, :email, :flight_id])
    end 
end