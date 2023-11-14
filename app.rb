require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'app_function'

class App
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
end
