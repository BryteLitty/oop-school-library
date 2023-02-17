require_relative 'app'

def main
  library = App.new

  loop do
    puts 'Please choose an option:'
    puts '1. List all books'
    puts '2. Add a book'
    puts '3. Rent a book'
    puts '4. Return a book'
    puts '5. List all rentals'
    puts '6. Quit'

    input = gets.chomp.to_i

    case input
    when 1
      library.list_all_books
    when 2
      puts 'Enter the tittle of the book:'
      title = gets.chomp
      puts 'Enter the author of the book:'
      author = gets.chomp
      puts 'Enter the publication date of the book:'
      date = gets.chomp
      library.create_book(title, author, date)
    when 3
      puts 'Enter the ID of the person who wants to rent the book:'
      person_id = gets.chomp.to_i
      puts 'Enter the ID of the book to rent:'
      book_id = gets.chomp.to_i
      puts 'Enter the date the rental will start (yyyy-mm-dd):'
      date = gets.chomp
      library.create_rental(person_id, book_id, date)
    when 4
      puts 'Enter the ID of the person who to return the book:'
      person_id = gets.chomp.to_i
      puts 'Enter the ID of the book to return:'
      book_id = gets.chomp.to_i
      puts 'Enter the date the rental will end (yyyy-mm-dd):'
      library.return_book(person_id, book_id, date)
    when 5
      puts 'Enter the ID of the person to list rentals for:'
      person_id = gets.chomp.to_i
      library.list_rentals_by_person(person_id)
    when 6
      break
      puts "Goodbye!"
    else
      puts 'Invalid option, please try again'
    end
  end
end

app = App.new
main
app.run
