def partition(ar, i, j)
	return ar if i==j
	#arbitrary choice of i as pivot
	pivot=i
	pivot_item = ar[pivot]

	left = i+1
	right = j

	while(left < right)
		#puts "left: #{left} #{ar[left]} right: #{right} #{ar[right]}"
		if (ar[left] > pivot_item && ar[right] < pivot_item)
			#swap is possible (mutually benefitial)
			swap(ar, left, right)
			left=left+1
			right=right-1
		elsif ar[right] > pivot_item
			right=right-1
		elsif ar[left] <= pivot_item
			left=left+1
		end
	end

	#swap the pivot item into its final location, unless no swaps occured previously (everything must be greater or less)
	swap(ar, i, right) unless ar[i] < ar[right]
	ar
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

	assert(partition(ar, 0, (ar.length-1)), [0])
end

def it_partitions_an_array_of_two
	ar = [0, 1]

	assert(partition(ar, 0, (ar.length-1)), [0, 1])
end

def it_partitions_an_array_of_three
	ar = [1, 0, 2]

	assert(partition(ar, 0, (ar.length-1)), [0, 1, 2])
end

def it_partitions_a_more_complicated_example
	ar = [5, 8, 1, 3, 7, 9, 2]

	assert(partition(ar, 0, (ar.length-1)), [3, 2, 1, 5, 7, 9, 8])
end

def it_partitions_with_everything_greater
	ar = [0, 9, 1, 1, 2, 3, 4, 5]

	assert(partition(ar, 0, (ar.length-1)), [0, 9, 1, 1, 2, 3, 4, 5])
end

def it_partitions_with_everything_less
	ar = [9, 1, 1, 5, 2, 3, 4, 1]

	assert(partition(ar, 0, (ar.length-1)), [1, 1, 1, 5, 2, 3, 4, 9])
end

def it_partitions_a_parasitic_example
	ar = [1, 1, 1, 1, 1, 1, 1]

	assert(partition(ar, 0, (ar.length-1)), [1, 1, 1, 1, 1, 1, 1])
end

it_partitions_an_array_of_one()
it_partitions_an_array_of_two()
it_partitions_an_array_of_three()
it_partitions_a_more_complicated_example()
it_partitions_with_everything_greater()
it_partitions_with_everything_less()
it_partitions_a_parasitic_example

puts "Passed"