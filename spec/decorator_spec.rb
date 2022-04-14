require_relative '../decorator'
require_relative '../nameable'

describe Decorator do
  before(:each) do
    @decorator = Decorator.new('Fernando')
  end

  it 'should have a nameable' do
    expect(@decorator.nameable).to eq('Fernando')
  end
end
