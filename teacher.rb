require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end

teacher = Teacher.new(33, 'math', 'aziz')
puts teacher.specialization
puts teacher.name
puts teacher.age
puts teacher.can_use_services
