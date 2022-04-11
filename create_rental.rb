require './rental'
require './checks'
require './app'

class Create_rental
  include Checks

  def initialize(rents, books, people)
    @rents = rents
    @people = people
    @books = books
  end

  def create_rental
    select_book
    select_person
    date = date(message: "Date (format YYYY/MM/DD):\s")
    rent = Rental.new(date, @book, @person)
    @rents << rent unless @rents.include?(rent)
    puts "Rental created successfully\n\n"
  end

  def select_book
    return unless @books.length.positive?

    loop do
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\""
      end
      number = gets.chomp
      @book = @books[number.to_i]
      break if number.to_i < @books.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def select_person
    return unless @books.length.positive?

    loop do
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      number = gets.chomp
      @person = @people[number.to_i]
      break if number.to_i < @people.length and number.to_i >= 0 and number.length.positive?
    end
  end
end
