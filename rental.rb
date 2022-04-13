class Rental
  attr_accessor :person, :date, :book

  def initialize(date, book, person)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end

  def to_json(*args)
    {
    JSON.create_id => self.class.name,
    'date' => @date,    
    'book_title' => @book.title,
    'id_people' => @person.id
    }.to_json(*args)
  end 
end
