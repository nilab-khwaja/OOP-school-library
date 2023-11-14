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

  def to_json
    {'id' => id, 'name' => name, 'age' => age, 'specialization' => specialization}.to_json
  end
end
