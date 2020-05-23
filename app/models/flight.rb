class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'
  
  has_many :passengers
  has_many :bookings
end
