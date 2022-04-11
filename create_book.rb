require './book'
require './checks'

class CreateBook
  include Checks

  def initialize(books)
    @books = books
    @book = nil
  end

  def create_book
    title = not_empty(message: "Title:\s")
    author = not_empty(message: "Author:\s")
    puts "Book created successfully \n\n"
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
  end
end
