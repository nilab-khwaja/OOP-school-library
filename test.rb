require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'classroom'
require_relative 'student'
# Create people
person1 = Person.new(25, 'John')
person2 = Person.new(15, 'Emily')

# Create books
book1 = Book.new('Book Title 1', 'Author 1')
book2 = Book.new('Book Title 2', 'Author 2')

# Rent books to people
book1.add_rental(person1, '2023-11-08')
book2.add_rental(person1, '2023-11-09')
book2.add_rental(person2, '2023-11-10')

# Check rentals for a person
puts "Rentals for #{person1.name}:"
person1.rentals.each do |rental|
  puts "Book Title: #{rental.book.title}, Rental Date: #{rental.date}"
end

# Check rentals for a book
puts "Rentals for #{book2.title}:"
book2.rentals.each do |rental|
  puts "Rented by: #{rental.person.name}, Rental Date: #{rental.date}"
end

classroom = Classroom.new('class A')
stu1 = Student.new(16, 'Alice')
stu2 = Student.new(23, 'Najm')
stu3 = Student.new(17, 'Jasmine')

stu1.assign_to_classroom(classroom)
stu2.assign_to_classroom(classroom)
stu3.assign_to_classroom(classroom)

puts "Student in #{classroom.label}:"
classroom.students.each do |student|
  puts "student Name : #{student.name}, Age: #{student.age}"
end
