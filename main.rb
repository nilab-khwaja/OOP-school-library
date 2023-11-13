require_relative 'app'

def main
  puts '------------------------------'
  puts 'Welcome to School Library App!'
  puts '------------------------------'  
  app = App.new  loop do
    app.display_menu
    option = gets.chomp.to_i    if option == 7
      puts 'Thank you for using this app!'
      break
    else
      app.choose_option(option)
    end
  rescue StandardError => e
    puts "An error occurred: #{e.message}"
    puts 'Please try again.'
  end
end
main