require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super(age, name: 'Unknown', parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
