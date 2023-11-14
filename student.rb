require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, name)
    @parent_permission = parent_permission
    @classroom = nil
  end

  def assign_to_classroom(classroom)
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def to_json
    {'id' => id, 'name' => name, 'age' => age, 'parent_permission' => parent_permission}.to_json
  end
end
