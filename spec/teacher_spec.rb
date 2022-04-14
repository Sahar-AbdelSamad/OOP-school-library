require_relative '../teacher'
describe Teacher do
  before(:each) do
    @teacher = Teacher.new('Maths', 18, name: 'John', parent_permission: true)
  end
  it 'should have a name' do
    expect(@teacher.name).to eq('John')
  end
  it 'should have an age' do
    expect(@teacher.age).to eq(18)
  end
  it 'should have rentals' do
    expect(@teacher.rentals).to eq([])
  end
  it 'should have a parent_permission' do
    expect(@teacher.parent_permission).to eq(true)
  end
  it 'should have a can_use_services?' do
    expect(@teacher.can_use_services?).to eq(true)
  end
  it 'should have a correct_name' do
    expect(@teacher.correct_name).to eq('John')
  end
end
