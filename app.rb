require './book'
require './student'
require './teacher'
require './rental'
require './person'
require './checks'
require_relative 'create_book'
require_relative 'create_person'

class App
  include Checks
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @create_book = Create_book.new(@books)
    @create_person = Create_person.new(@people)
    @rents = []
  end

  def run(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      @create_person.create_person
    when 4
      @create_book.create_book
    when 5
      create_rental
    when 6
      list_rental
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: \"#{book.author}\""
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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
      list_books
      number = gets.chomp
      @book = @books[number.to_i]
      break if number.to_i < @books.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def select_person
    return unless @books.length.positive?

    loop do
      puts 'Select a person from the following list by number (not id)'
      list_people
      number = gets.chomp
      @person = @people[number.to_i]
      break if number.to_i < @people.length and number.to_i >= 0 and number.length.positive?
    end
  end

  def list_rental
    print "ID of person:\s"
    id = gets.chomp.to_i
    puts "Rentals:\s"
    @rents.map do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}\n\n" if id == rental.person.id
    end
  end
end
