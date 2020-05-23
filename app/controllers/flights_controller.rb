class FlightsController < ApplicationController
  def new
  end

  def index
    @airports = Airport.all.map{ |airport| [airport.code, airport.id] }
    @num_of_pass = [[1], [2], [3], [4]]
    @date = Flight.distinct.pluck(:departure_date).map{|x| [x]}
    @flight = Flight.where(["departure_airport_id = ?  and arrival_airport_id = ? and departure_date = ?",
                             params[:departure_airport], 
                             params[:arrival_airport], 
                             params[:departure_date]])
  end
end
