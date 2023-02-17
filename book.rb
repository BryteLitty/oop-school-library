# book class
class Book
  attr_reader :title, :author, :date, :id

  def initialize(title, author, date)
    @id = 0
    @title = title
    @author = author
    @date = date
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end
end
