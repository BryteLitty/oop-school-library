# Rental class
class Rental
  attr_accessor :date
  attr_reader :person, :Book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
  end
end
