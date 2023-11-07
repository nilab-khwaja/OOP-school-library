require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

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

teacher = Teacher.new(33, 'math', 'aziz')
puts teacher.specialization
puts teacher.name
puts teacher.age
puts teacher.can_use_services

student = Student.new(15, 'B', 'Akasha')
puts student.name
puts student.age
puts student.classroom
puts student.play_hooky

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
