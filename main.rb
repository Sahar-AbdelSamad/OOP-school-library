#!/usr/bin/env ruby
require './app'
def main
  puts 'Welcome to school Library App!'

  app = App.new
  loop do
    puts "Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person id
        7 - Exit"
    choice = gets.chomp

    break if choice == 7

    app.run(choice)
  end

  puts "Thank you for using this app!\n\n"
end
main
