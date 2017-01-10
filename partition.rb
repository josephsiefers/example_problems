def partition(ar, i, j)
	return i if i==j
	#arbitrary choice of i as pivot
	pivot=j
	#puts "Pivot: #{pivot} pivot_item: #{ar[pivot]}"
	pivot_item = ar[pivot]

	left = i
	right = j-1

	while(left < right)
		#puts "left: #{left} #{ar[left]} right: #{right} #{ar[right]}"
		if (ar[left] > pivot_item && ar[right] < pivot_item)
			#swap is possible (mutually benefitial)
			#puts "Swapping left and right"
			swap(ar, left, right)
			left=left+1
			right=right-1
		elsif ar[left] < pivot_item
			#puts "Advancing left"
			left=left+1
		elsif ar[right] >= pivot_item
			#puts "Advancing right"
			right=right-1
		end
	end

	#puts "Left: #{left}, #{ar[left]} pivot: #{pivot} #{ar[pivot]}"
	if (ar[left] < ar[pivot])
		swap(ar, pivot, left+1)
		return (left + 1)
	else
		swap(ar, pivot, left)
		return left
	end
end

def swap(ar, i, j)
	return ar if i==j
	#puts "Swapping: #{i}: #{ar[i]} with #{j}: #{ar[j]}"
	ar[i], ar[j] = [ar[j], ar[i]]
	ar
end

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

def it_partitions_an_array_of_one
	ar = [0]

	assert(partition(ar, 0, (ar.length-1)), 0)
	assert(ar, [0])
end

def it_partitions_an_array_of_two
	ar = [0, 1]

	assert(partition(ar, 0, (ar.length-1)), 1)
	assert(ar, [0, 1])
end

def it_partitions_an_array_of_three_mid_pivot
	ar = [9, 7, 8]

	assert(partition(ar, 0, (ar.length-1)), 1)
	assert(ar, [7, 8, 9])
end

def it_partitions_a_more_complicated_example
	ar = [5, 8, 1, 3, 7, 9, 2]

	assert(partition(ar, 0, (ar.length-1)), 1)
	assert(ar, [1, 2, 5, 3, 7, 9, 8])
end

def it_partitions_with_everything_greater
	ar = [5, 9, 1, 1, 2, 3, 4, 0]

	assert(partition(ar, 0, (ar.length-1)), 0)
	assert(ar, [0, 9, 1, 1, 2, 3, 4, 5])
end

def it_partitions_with_everything_less
	ar = [1, 1, 1, 5, 2, 3, 4, 9]

	assert(partition(ar, 0, (ar.length-1)), 7)
	assert(ar, [1, 1, 1, 5, 2, 3, 4, 9])
end

def it_partitions_a_parasitic_example
	ar = [1, 1, 1, 1, 1, 1, 1]

	assert(partition(ar, 0, (ar.length-1)), 0)
	assert(ar, [1, 1, 1, 1, 1, 1, 1])
end

def it_partitions_incorrectly
	ar = [157, 238, 90, 266, 187, 200, 74, 196, 312, 142, 160, 143, 220, 139, 136, 97, 149, 79, 234, 68, 150, 356, 318, 69, 88, 177, 252, 288, 120, 222, 270, 108, 263, 103, 321, 65, 316, 275, 331, 117, 183, 184, 128, 323, 141, 204, 46, 172, 48, 95, 359, 239, 209, 64, 99, 226, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273]

	assert(partition(ar, 0, (ar.length-1)), 54)
	assert(ar, [157, 238, 90, 266, 187, 200, 74, 196, 54, 142, 160, 143, 220, 139, 136, 97, 149, 79, 234, 68, 150, 52, 61, 69, 88, 177, 252, 121, 120, 222, 270, 108, 263, 103, 162, 65, 233, 86, 171, 117, 183, 184, 128, 226, 141, 204, 46, 172, 48, 95, 99, 239, 209, 64, 273, 323, 331, 275, 316, 293, 321, 288, 318, 317, 356, 312, 359])
end

it_partitions_an_array_of_one()
it_partitions_an_array_of_two()
it_partitions_an_array_of_three_mid_pivot()
it_partitions_a_more_complicated_example()
it_partitions_with_everything_greater()
it_partitions_with_everything_less()
it_partitions_a_parasitic_example()
it_partitions_incorrectly()

puts "Passed"