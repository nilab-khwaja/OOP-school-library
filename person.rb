class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person1 = Person.new(25, 'Nilab')
puts "ID: #{person1.id}"
puts "Name: #{person1.name}"
puts "Age: #{person1.age}"
puts person1.can_use_services? ? 'Can use services' : 'Cannot use services'

person2 = Person.new(15, 'Ahmad', parent_permission: false)
puts "ID: #{person2.id}"
puts "Name: #{person2.name}"
puts "Age: #{person2.age}"
puts person2.can_use_services? ? 'Can use services' : 'Cannot use services'
