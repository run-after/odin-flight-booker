class Passenger < ApplicationRecord
  belongs_to :booking
  belongs_to :flight

  validates :name, :email, :flight_id, presence: true
end
