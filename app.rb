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

  def load_people
    if File.exist?('people.json')
      data = JSON.parse(File.read('people.json'), create_additions: true)
      data.each do |person|
        case person['json_class']
        when 'Student'
          student = Student.new(nil, person['age'], name: person['name'],
                                                    parent_permission: person['parent_permission'])

          student.id = person['id']
          @people.push(student)
        when 'Teacher'
          teacher = Teacher.new(person['specialization'], person['age'], name: person['name'])
          teacher.id = person['id']
          @people.push(teacher)
        end
      end
    else
      []
    end
  end

  def load_files
    load_books
    load_people
    load_rentals
  end

  def load_rentals
    if File.exist?('rentals.json')
      data = JSON.parse(File.read('rentals.json'), create_additions: true)
      data.map do |rentals|
        person = @people.find { |people| people.id == rentals['id_people'] }
        book = @books.find { |books| books.title == rentals['book_title'] }
        @rents.push(Rental.new(rentals['date'], book, person))
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
    File.write('people.json', JSON.generate(@people))
    File.write('rentals.json', JSON.generate(@rents))
  end
end
