require_relative 'abstraction'
module ExamInfo
  include Abstraction
  call_without_q(['ExamSchedule'])
end