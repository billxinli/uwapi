require_relative 'abstraction'
module Geolocation
  include Abstraction
  call_without_q(['Buildings', 'ParkingList', 'BuildingCoordinates', 'WatPark'])
end