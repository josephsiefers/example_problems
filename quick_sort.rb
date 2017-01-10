def quick_sort(ar, i=0, j=nil)
	#initialize j if necessary
	j||=(ar.length-1)

	#puts "Quick Sort: (#{i}, #{j})"

	return ar if i >= j

	#puts "Partitioning: (#{i},#{j}) - #{ar.join(' ')}"
	midpoint = partition(ar, i, j)
	#puts "After partition: #{ar.join(' ')}"
	puts ar.join(' ')

	#puts "midpoint: #{midpoint}"
	quick_sort(ar, i, midpoint-1)
	quick_sort(ar, (midpoint+1), j)
	ar
end

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
			swap(ar, left, right)
			left=left+1
			right=right-1
		elsif ar[left] < pivot_item
			left=left+1
		elsif ar[right] >= pivot_item
			right=right-1
		end
		#puts ar.join(' ')
	end

	#puts "Final swap: #{ar[pivot]} #{ar[right]}"
	if ar[pivot] > ar[left]
		return pivot
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

def it_sorts_an_array_with_one_element
	ar = [0]

	assert(quick_sort(ar), [0])
end

def it_sorts_an_array_with_two_elements
	ar = [1, 0]

	assert(quick_sort(ar), [0, 1])
end

def it_sorts_an_array_with_three_elements
	ar = [1, 3, 2]

	assert(quick_sort(ar), [1, 2, 3])
end

def it_sorts_a_more_complicated_example
	ar = [5, 8, 1, 3, 7, 9, 2]

	assert(quick_sort(ar), [1, 2, 3, 5, 7, 8, 9])
end

def it_sorts_another_complicated_example
	ar = [1, 3, 2, 5, 9, 7, 8]

	assert(quick_sort(ar), [1, 2, 3, 5, 7, 8, 9])
end

def it_sorts_a_sorted_array
	ar = [1, 2, 3, 5, 7, 8, 9]

	assert(quick_sort(ar), [1, 2, 3, 5, 7, 8, 9])
end

def it_sorts_a_parasitic_example
	ar = [1, 1, 1, 1, 1, 1]

	assert(quick_sort(ar), [1, 1, 1, 1, 1, 1])
end

it_sorts_an_array_with_one_element()
it_sorts_an_array_with_two_elements()
it_sorts_an_array_with_three_elements()
it_sorts_a_more_complicated_example()
it_sorts_another_complicated_example()
it_sorts_a_sorted_array()
it_sorts_a_parasitic_example()

#partition(4,6)
#0 1 2 3 4 5 6
#1 2 3 5 7 9 8
#

puts "Passed"