class Rental
  attr_accessor :person, :date, :book

  def initialize(date, book, person)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end
end
