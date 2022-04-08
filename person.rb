require './nameable'
require './decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    rental = Rental.new(date, book, self)
    @rentals << rental unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
