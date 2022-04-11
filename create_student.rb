require './student'
require './checks'

class Create_student
  include Checks

  def initialize(person)
    @person = person
  end

  def create_student
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    loop do
      print "Has parent permission [Y/N]?\s"
      permission = gets.chomp
      if %w[y Y].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: true)
        @person << student unless @person.include?(student)
        break
      elsif %w[n N].include?(permission)
        student = Student.new(nil, age, name: name, parent_permission: false)
        @person << student unless @person.include?(student)
        break
      end
    end
  end
end
