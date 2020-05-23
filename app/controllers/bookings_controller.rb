class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @num_of_pass = params[:num_of_pass].to_i
    @booking = Booking.new
    @num_of_pass.times do |num|
      instance_variable_set("@passenger#{num+1}", Passenger.new)
    end
  end

  def create
    num_of_pass = params[:booking][:num_of_pass].to_i
    @booking = Booking.new(booking_params)#flight_id: params[:booking][:flight_id]
    if @booking.save
      num_of_pass.times do |num|
        @booking.passengers.create(name: params[:booking]["@passenger#{num+1}"][:name],
                                   email: params[:booking]["@passenger#{num+1}"][:email],
                                   flight_id: @booking.flight_id)
      end
    end
    if @booking.passengers.count == num_of_pass
      redirect_to booking_path(@booking)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(:flight_id, passenger_attributes: [:name, :email, :flight_id])
    end 
end
