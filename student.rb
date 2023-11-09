require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, _parent_permission, name = 'Unknown')
    super(age, name)
    @classroom = nil
  end

  def assign_to_classroom(classroom)
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
