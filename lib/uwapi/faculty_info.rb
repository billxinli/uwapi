require_relative 'abstraction'
module FacultyInfo
  include Abstraction
  call_without_q(['FacultiesList', 'DepartmentsList', 'TermsList'])
end