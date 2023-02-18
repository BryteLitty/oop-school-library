require './app'

def display_options
  'Please choose an option by entering a number:
  1 - List of all books
  2 - List of all people
  3 - Add a person
  4 - Create a book
  5 - Add a rental
  6 - List of all rental for given id
  7 - Exit'
end

def user_option
  user_choice = gets.chomp.to_i
  user_choice.positive? && user_choice <= 7 ? user_choice : 'Invalid'
end

def available_options(user_choice, library)
  case user_choice
  when 1
    library.list_books
  when 2
    library.list_people
  when 3
    library.create_person
  when 4
    library.create_book
  when 5
    library.create_rental
  when 6
    library.list_rentals
  else
    puts 'Thank you for using this app!\\n'
    exit
  end
end

def main
  library = App.new

  puts "Welcome to School library App!\n\n"

  loop do
    puts display_options
    print 'Your option: '
    option = user_option
    puts option == 'Invalid' ? 'Invalid option, please type correct number!' : available_options(option, library)
  end
end

main
