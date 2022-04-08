require './book'
require './student'
require './teacher'
require './rental'
require './person'
require './checks'

class App
  include Checks
  attr_accessor :books, :people

  def initialize
    @people = []
    @books = []
    @book = nil
    @person = nil
    @rents = []
  end

  def run(choice)
    list_books if choice == 1
    list_people if choice == 2
    create_person if choice == 3
    create_book if choice == 4
    create_rental if choice == 5
    list_rental if choice == 6
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

  def create_person
    loop do
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]:\s"
      person = gets.chomp
      case person
      when '1'
        create_student
      when '2'
        create_teacher
      end

      break if %w[1 2].include?(person)
    end

    puts "Person created successfully\n\n"
  end

  def create_student
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    loop do
      print "Has parent permission [Y/N]?\s"
      permission = gets.chomp
      if %w[y Y].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: true)
        @people << student unless @people.include?(student)
        break
      elsif %w[n N].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: false)
        @people << student unless @people.include?(student)
        break
      end
    end
  end

  def create_teacher
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    specialization = not_empty(message: "Specialization:\s")
    teacher = Teacher.new(specialization, age, name: name)
    @people << teacher unless @people.include?(teacher)
  end

  def create_book
    title = not_empty(message: "Title:\s")
    author = not_empty(message: "Author:\s")
    puts "Book created successfully \n\n"
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
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
