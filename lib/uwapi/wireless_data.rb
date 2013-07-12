require_relative 'abstraction'
module WirelessData
  include Abstraction
  call_without_q(['APLocations'])
  call_with_q(['APInfo'])
end