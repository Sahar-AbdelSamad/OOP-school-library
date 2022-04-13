require '../student'
require '../person'

describe Student do
  before(:each) do
    @student = Student.new('1A', 18, name: 'John', parent_permission: true)
  end

  it 'should have a name' do
    expect(@student.name).to eq('John')
  end

  it 'should have an age' do
    expect(@student.age).to eq(18)
  end

  it 'should have rentals' do
    expect(@student.rentals).to eq([])
  end

  it 'should have a parent_permission' do
    expect(@student.parent_permission).to eq(true)
  end

  it 'should have a can_use_services?' do
    expect(@student.can_use_services?).to eq(true)
  end

  it 'should have a correct_name' do
    expect(@student.correct_name).to eq('John')
  end
end
