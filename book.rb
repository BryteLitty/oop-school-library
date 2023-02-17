# book class
# book class
class Book
  attr_reader :title, :author, :date, :id
  @@id = 0

  def initialize(title, author, date)
    @@id += 1
    @id = @@id
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
