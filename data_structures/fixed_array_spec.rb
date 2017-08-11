require_relative 'fixed_array'

describe 'FixedArray' do

  it 'instantiates a new fixed array with space for number of items passed in as parameter' do
    array = FixedArray.new(8)
    expect(array.size).to eq 8
  end

  # it do
  # end

  # it do
  # end
end
