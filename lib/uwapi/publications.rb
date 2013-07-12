require_relative 'abstraction'
module Publications
  include Abstraction
  call_without_q(['RecentDissertations'])
  call_with_q(['DissertationDetails'])
end