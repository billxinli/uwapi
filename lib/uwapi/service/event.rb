require_relative 'abstraction'
module Event
  include Abstraction
  call_without_q(['Events', 'CalendarEvents', 'Holidays'])
end