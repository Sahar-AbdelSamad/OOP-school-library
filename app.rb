require './book'
require './student'
require './teacher'
require './rental'
require './person'
require './checks'
require_relative 'create_book'
require_relative 'create_person'
require './create_rental'
require 'json'

class App
  include Checks
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @rents = []
    @create_book = CreateBook.new(@books)
    @create_person = CreatePerson.new(@people)
    @create_rental = CreateRental.new(@rents, @books, @people)
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

  def load_books
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'), create_additions: true)
      data.each do |book|
        @books.push(Book.new(book['title'], book['author']))
      end
    else
      []
    end
  end

  def list_books    
    @books.each { |book| puts "Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
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

  def save_files
    File.write('books.json', JSON.generate(@books))    
    end 
end
