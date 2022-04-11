require './teacher'
require './checks'

class Create_teacher
  include Checks

  def initialize(person)
    @person = person
  end

  def create_teacher
    age = numeric(message: "Age:\s")
    name = not_empty(message: "Name:\s")
    specialization = not_empty(message: "Specialization:\s")
    teacher = Teacher.new(specialization, age, name: name)
    @person << teacher unless @person.include?(teacher)
  end
end
