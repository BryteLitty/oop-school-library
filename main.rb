require_relative 'app'

def main
  app = App.new

  loop do
    puts 'What would you like to do?'
    puts '1 - List all books'
    puts '2 - Add a book'
    puts '3 - Remove a book'
    puts '4 - Rent a book'
    puts '5 - List rentals by person'
    puts '6 - Exit'

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books
    when 2
      puts 'Enter book title:'
      title = gets.chomp
      puts 'Enter book author:'
      author = gets.chomp
      puts 'Enter book publication date (YYYY-MM-DD):'
      date = gets.chomp
      app.add_book(title, author, date)
    when 3
      puts 'Enter book id to remove:'
      id = gets.chomp.to_i
      app.remove_book(id)
    when 4
      puts 'Enter book id to rent:'
      book_id = gets.chomp.to_i
      puts 'Enter person id:'
      person_id = gets.chomp.to_i
      app.rent_book(book_id, person_id)
    when 5
      puts 'Enter person id:'
      person_id = gets.chomp.to_i
      app.list_rentals_by_person(person_id)
    when 6
      puts 'Goodbye!'
      break
    else
      puts 'Invalid choice'
    end
  end
end

main
