require './book'
require './student'
require './teacher'
require './rental'
require './person'
require './checks'
require_relative 'create_book'
require_relative 'create_person'
require './create_rental'

class App
  include Checks
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @rents = []
    @create_book = Create_book.new(@books)
    @create_person = Create_person.new(@people)
    @create_rental = Create_rental.new(@rents, @books, @people)
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
      @create_rental.create_rental
    when 6
      list_rental
    end
  end

  def list_books
    @books.each { |book|puts "Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  def list_people
    @people.each_with_index {|person, index| puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
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
