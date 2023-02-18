# frozen_string_literal: true

# book class

require 'date'

class Book
  attr_reader :title, :author, :date, :id

  def initialize(title, author)
    @id = 0
    @title = title
    @author = author
    @date = Date.today
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end
end
