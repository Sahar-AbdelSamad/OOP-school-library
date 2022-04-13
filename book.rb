class Book
  attr_accessor :rentals, :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    rental = Rental.new(date, self, person)
    @rentals << rental unless @rentals.include?(rental)
  end     

  def to_json(*args)
    {
    JSON.create_id => self.class.name,
    'title' => @title,
    'author' => @author
    }.to_json(*args)
    end 
end
