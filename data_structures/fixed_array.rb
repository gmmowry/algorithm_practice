class FixedArray

  attr_reader :array

  def initialize(size)
    @array = self.new(size)
  end

  def new(size)
    Array.new(size)
  end

  def get(index)
    throw_err(index)
    @array[index]
  end

  def set(index, element)
    throw_err(index)
    @array.insert(index, element)
  end

  def throw_err(index)
    raise OutOfBoundsException unless index < @array.length
  end

end

class OutOfBoundsException < StandardError
  def initialize(msg="This index is out of the bounds of the fixed array.")
    super(msg)
  end
end

# pooter = FixedArray.new(8)
# p pooter.array.length

# pooter.set(2, "hello")
# pooter.set(5, "what up")
# pooter.set(12, 1)

# pooter.get(2)

# pooter.get(10)
