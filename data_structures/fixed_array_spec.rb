require_relative 'fixed_array'

describe 'FixedArray' do

  it 'instantiates a new fixed array with space for number of items passed in as parameter' do
    fixed_array = FixedArray.new(8)
    expect(fixed_array.array.length).to eq 8
  end

  it 'can retrieve a value in the array based on index' do
    fixed_array = FixedArray.new(8)
    expect(fixed_array.get(7)).to eq nil
  end

  it 'can set a value in the array given an index' do
    fixed_array = FixedArray.new(4)
    fixed_array.set(3, "hello")
    expect(fixed_array.get(3)).to eq "hello"
  end

  it 'throws an out of bounds error when an index given is not valid' do
    fixed_array = FixedArray.new(4)
    expect{fixed_array.get(7)}.to raise_error(OutOfBoundsException)
  end

  it 'throws an out of bounds error when a given index is not valid' do
    fixed_array = FixedArray.new(4)
    expect{fixed_array.set(7, "invalid")}.to raise_error(OutOfBoundsException)
  end
end
