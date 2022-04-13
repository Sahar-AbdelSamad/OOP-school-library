require '../rental'
require '../person'
require '../book'
describe Rental do
  before(:each) do
    @person = Person.new(18, name: 'John', parent_permission: true)
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    @rental = Rental.new('2020/10/10', @book, @person)
  end

  it 'takes 3 parameters and returns a Rental object' do
    expect(@rental).to be_an_instance_of Rental
  end

  it 'should have a date' do
    expect(@rental.date).to eq('2020/10/10')
  end

  it 'should have a book' do
    expect(@rental.book).to eq(@book)
  end

  it 'should have a person' do
    expect(@rental.person).to eq(@person)
  end
end
