require_relative 'abstraction'
module Weather
  include Abstraction
  call_without_q(['Weather'])
end