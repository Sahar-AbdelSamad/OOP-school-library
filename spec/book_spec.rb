require '../book'

describe Book do
  before(:each) do
    @book = Book.new('Ruby', 'Sahar')
  end

  it 'should have a title' do
    expect(@book.title).to eq('Ruby')
  end

  it 'should have an author' do
    expect(@book.author).to eq('Sahar')
  end

  it 'should have rentals' do
    expect(@book.rentals).to eq([])
  end
end
