require_relative 'abstraction'
module Course
  include Abstraction
  call_with_q(['CourseSearch', 'CourseInfo', 'Prerequisites', 'CourseFromRoom'])
end