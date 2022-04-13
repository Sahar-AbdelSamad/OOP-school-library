require '../classroom'
require '../student'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('A')
  end

  it 'takes 1 parameter and returns a Classroom object' do
    expect(@classroom).to be_an_instance_of Classroom
  end

  it 'should have a label' do
    expect(@classroom.label).to eq('A')
  end

  it 'should have an empty students array' do
    expect(@classroom.students).to eq([])
  end

  it 'should add a student to the students array' do
    student = Student.new('1A', 18, name: 'John', parent_permission: true)
    @classroom.add_student(student)
    expect(@classroom.students).to eq([student])
  end
end
