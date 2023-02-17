require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def run
    create_person('John', 25, 'student')
    create_person('Jane', 30, 'teacher')
    create_book('The Great Gatsby', 'F. Scott Fitzgerald', '1925')
    create_book('To Kill a Mockingbird', 'Harper Lee', '1960')
    create_rental(1, 1, '2022-02-14')
    create_rental(2, 2, '2022-02-15')
    list_all_people
    list_all_books
    list_rentals_by_person(1)
  end

  def list_all_books
    puts 'Books:'
    @books.each { |book| puts "#{book.title} by #{book.author} (#{book.date})" }
    puts ''
  end

  def list_all_people
    puts 'People:'
    @people.each { |person| puts "#{person.name} (#{person.class}) - #{person.age} years old" }
    puts ''
  end

  def create_person(name, age, type)
    if type == 'student'
      @people << Student.new(age, 'A', name: name)
    elsif type == 'teacher'
      @people << Teacher.new(age, 'Math', name: name)
    else
      puts "Invalid type: #{type}"
    end
  end

  def create_book(title, author, date)
    @books << Book.new(title, author, date)
  end

  def create_rental(person_id, book_id, date)
    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.id == book_id }

    if person && book
      rental = Rental.new(date, book, person)
      book.add_rental(rental)
      person.add_rental(rental)
      puts "Rental created: #{rental}"
    else
      puts "Invalid rental: person id #{person_id} or book id #{book_id} not found"
    end
  end

  def return_book(book_id, person_id, return_date)
    rental = @rentals.find { |rental| rental.book.id == book_id && rental.person.id == person_id && rental.return_date.nil? }
    if rental.nil?
      puts "Invalid return: person id #{person_id} or book id #{book_id} not found or rental already returned"
    else
      rental.return_date = return_date
      puts "Book '#{rental.book.title}' returned by #{rental.person.name} on #{rental.return_date}"
    end
  end

  def list_rentals_by_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      rentals = person.rentals
      puts "Rentals for #{person.name}:"
      rentals.each { |rental| puts "#{rental.book.title} (#{rental.date})" }
      puts ''
    else
      puts "Person not found with id #{person_id}"
    end
  end
end
