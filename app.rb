require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'app_function'
require 'json'
require 'date'

class App
  attr_accessor :people, :book, :rentals
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def display_menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Add a person'
    puts '4 - Add a book'
    puts '5 - Add a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def choose_option(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      list_all_rentals
    else
      'Wrong number please enter a number between 1 and 7'
    end
  end

  include AppFunctions

  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rental: '
    rentals_found = false
    @rentals.each do |rental|
      if rental.person.is_a?(Person) && rental.person.id.to_i == id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        rentals_found = true
      end
    end

    puts 'No rentals found for the specified person.' unless rentals_found
  end

  def save_data
    save_books
    save_people
    save_rentals
  end

  def load_data
    load_books
    load_people
    load_rentals
  end

  private

  def save_books
    File.open('books.json', 'w') do |file|
      file.write(JSON.generate(@books))
    end
  end

  def load_books
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'))
      @books = data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
    end
  end

  def save_people
    File.open('people.json', 'w') do |file|
      file.write(JSON.generate(@people))
    end
  end

  def load_people
    if File.exist?('people.json')
      data = JSON.parse(File.read('people.json'))

      @people = data.map do |person_data|
        puts "Loading person data: #{person_data.inspect}"

        if person_data['class'] == 'Student'
          Student.new(person_data['age'], person_data['parent_permission'], person_data['name'])
        elsif person_data['class'] == 'Teacher'
          Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
        end
      end
    end
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      file.write(JSON.generate(@rentals))
    end
  end

  def load_rentals
    if File.exist?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))

      @rentals = data.map do |rental_data|
        puts "Loading rental data: #{rental_data.inspect}"

        book_data = rental_data['book']
        person_data = rental_data['person']

        book = @books.find { |b| b.title == book_data['title'] && b.author == book_data['author'] }
        person = @people.find { |p| p.id == person_data['id'] }

        if person
          rental = Rental.new(Date.parse(rental_data['date']), book, person)
          person.rentals ||= []
          person.rentals << rental
          rental
        else
          puts "Invalid rental data (person not found): #{rental_data.inspect}"
          nil  # Ignore invalid data
        end
      end.compact  # Remove nil entries
    end
  end

end
