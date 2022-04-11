require './create_student'
require './create_teacher'

class CreatePerson
  def initialize(person)
    @person = person
    @create_student = CreateStudent.new(@person)
    @create_teacher = CreateTeacher.new(@person)
  end

  def create_person
    loop do
      print "Do you want to create a student (1) or a teacher (2)? [Input the number]:\s"
      person = gets.chomp
      case person
      when '1'
        @create_student.create_student
      when '2'
        @create_teacher.create_teacher
      end

      break if %w[1 2].include?(person)
    end

    puts "Person created successfully\n\n"
  end
end
