
def insertion_sort(ar)
	(ar.length-1).downto(1) do |i|
		break unless ar[i] < ar[i-1]
		swap(ar, i, i-1)
	end
	ar
end

def insertion_sort_no_swap(ar)
	val = ar.last
	(ar.length-1).downto(1) do |i|
		if (val < ar[i-1])
			ar[i] = ar[i-1]
		else
			ar[i] = val
			break
		end
	end
	#when we don't swap, we need to check at the very end...
	(ar[0] = val) if val < ar[0] 

	ar
end

def swap(ar, i, j)
	ar[i], ar[j] = [ar[j], ar[i]]
end

# [3] => [3]
# [8, 3] => [3, 8]
# [1, 8, 3] => [1, 3, 8]

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

def it_handles_an_empty_array
	ar = []

	assert(insertion_sort(ar), [])
end

def it_handles_an_empty_array_no_swap
	ar = []

	assert(insertion_sort_no_swap(ar), [])
end

def it_handles_a_single_element
	ar = [8]

	assert(insertion_sort(ar), [8])
end

def it_handles_a_single_element_no_swap
	ar = [8]

	assert(insertion_sort_no_swap(ar), [8])
end

def it_swaps_elements_larger_than_the_last_element
	ar = [8, 3]

	assert(insertion_sort(ar), [3, 8])
end

def it_breaks_once_it_finds_a_smaller_element
	ar = [1, 8, 3]

	assert(insertion_sort(ar), [1, 3, 8])
end

def it_handles_a_large_array
	ar = [2, 4, 6, 8, 3]

	assert(insertion_sort(ar), [2, 3, 4, 6, 8])
end

def it_handles_a_large_array_no_swap
	ar = [2, 4, 6, 8, 3]

	assert(insertion_sort_no_swap(ar), [2, 3, 4, 6, 8])
end

def it_handles_duplicate_elements
	ar = [2, 4, 4, 8, 3]

	assert(insertion_sort(ar), [2, 3, 4, 4, 8])
end

def it_handles_duplicate_elements_no_swap
	ar = [2, 4, 4, 8, 3]

	assert(insertion_sort_no_swap(ar), [2, 3, 4, 4, 8])
end

def it_handles_elements_destined_for_the_first_location
	ar = [2, 4, 6, 8, -10000]

	assert(insertion_sort(ar), [-10000, 2, 4, 6, 8])
end

def it_handles_elements_destined_for_the_first_location_no_swap
	ar = [2, 4, 6, 8, -10000]

	assert(insertion_sort_no_swap(ar), [-10000, 2, 4, 6, 8])
end

def it_handles_annoying_example
	ar = %w{1 3 5 9 13 22 27 35 46 51 55 83 87 23}

	assert(insertion_sort(ar), %w{1 3 5 9 13 22 23 27 35 46 51 55 83 87})
end


def it_handles_annoying_example_no_swap
	ar = %w{1 3 5 9 13 22 27 35 46 51 55 83 87 23}

	assert(insertion_sort_no_swap(ar), %w{1 3 5 9 13 22 23 27 35 46 51 55 83 87})
end


# it_handles_an_empty_array()
# it_handles_a_single_element()
# it_handles_a_single_element_no_swap()
# it_swaps_elements_larger_than_the_last_element()
# it_breaks_once_it_finds_a_smaller_element()
# it_handles_a_large_array()
# it_handles_a_large_array_no_swap()
# it_handles_duplicate_elements()
# it_handles_duplicate_elements_no_swap()
# it_handles_elements_destined_for_the_first_location()
# it_handles_elements_destined_for_the_first_location_no_swap()
it_handles_annoying_example()
it_handles_annoying_example_no_swap()

puts "Passed"
