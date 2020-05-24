class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport'
  belongs_to :departure_airport, class_name: 'Airport'
  
  has_many :passengers
  has_many :bookings

  validates :arrival_airport, :departure_airport, 
            :departure_date, :duration, presence: true
end
