# book class
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rentals = Rental.new(person, self, date)
    @rentals << rental
    person.add_rental(rental)
    self
  end
end
