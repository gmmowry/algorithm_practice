def partition_array(array, left, right, pivot_index)
  pivot = array[pivot_index]
  # swap the values at pivot index and right-most
  array[pivot_index], array[right] = array[right], array[pivot_index]
  # create the "wall"
  wall_index = left
  # iterate through all of the values from left to right, not incuding right
  (left..right-1).each do |i|
    # if the value is less than the pivot
    if array[i] < pivot
      # move it to the left side of the wall
      array[i], array[wall_index] = array[wall_index], array[i]
      # move the wall up by wall
      wall_index += 1
    end
  end
  # swap the number at the wall with the right (which was the original pivot)
  array[wall_index], array[right] = array[right], array[wall_index]
  # return the wall index which will be our new pivot used in the sort method
  return wall_index
end

def sort(array, left=0, right=(array.length-1))
  # cannot shuffle since we recursively call the method
  # arr.shuffle
  # can't set these in the method, need to be optional arguments
  # left = 0
  # right = arr.length - 1
  if left < right
    # pick a middle pivot index, take the left most, plus the right-most minus left-most
    # the righ-most and left-most will change as we partition the array
    # divide it by two and then switch to an integer, this gives us a middle-of-the-array
    # index for our pivot index
    # we'll use the pivot index to partition the array and return a new pivot index as we
    # move the "wall" up, then use that index as an argument as we sort the left and right
    # arrays after we partition
    pivot_index = (left + ((right - left) / 2)).to_i
    # partition the array using a separate method
    new_pivot_index = partition_array(array, left, right, pivot_index)
    # call sort recursively but only sorting the left side
    sort(array, left, new_pivot_index - 1)
    # call sort recursively only sorting the right side
    sort(array, (new_pivot_index + 1), right)
  end
  # return the sorted array
  return array
end
