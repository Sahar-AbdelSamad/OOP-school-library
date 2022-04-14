require_relative '../person'

describe Person do
  before(:each) do
    @person = Person.new(18, name: 'John', parent_permission: true)
  end

  it 'should have a name' do
    expect(@person.name).to eq('John')
  end

  it 'should have an age' do
    expect(@person.age).to eq(18)
  end

  it 'should have rentals' do
    expect(@person.rentals).to eq([])
  end

  # it 'should have a parent_permission' do
  #   expect(@person.parent_permission).to eq(true)
  # end

  it 'should have a can_use_services?' do
    expect(@person.can_use_services?).to eq(true)
  end

  # it 'should have a correct_name' do
  #   expect(@person.correct_name).to eq('John')
  # end

  # it 'should have a to_json' do
  #   expect(@person.to_json).to eq('{"id":1,"name":"John","age":18,"parent_permission":true}')
  # end
end
