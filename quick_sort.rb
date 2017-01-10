def quick_sort(ar, i=0, j=nil)
	#initialize j if necessary
	j||=(ar.length-1)

	#puts "Quick Sort: (#{i}, #{j})"

	return ar if i >= j

	#puts "Partitioning: (#{i},#{j})"
	pivot_idx = partition(ar, i, j)
	#puts ar.join(', ')
	#puts "pivot_idx: #{pivot_idx} pivot_item: #{ar[pivot_idx]}"
	#check_partition(ar, pivot_idx)
	quick_sort(ar, i, pivot_idx-1)
	quick_sort(ar, (pivot_idx+1), j)
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

def check_partition(ar, pivot_idx)
	pivot_item = ar[pivot_idx]

	(0..(pivot_idx-1)).each do |i|
		raise "#{pivot_idx}: #{pivot_item} < #{i}: #{ar[i]}" if pivot_item < ar[i]
	end

	((pivot_idx+1)..(ar.length-1)).each do |i|
		raise "#{pivot_idx}: #{pivot_item} < #{i}: #{ar[i]}" if pivot_item > ar[i]
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

def it_sorts_a_fucking_ridiculous_example
	ar = [406, 157, 415, 318, 472, 46, 252, 187, 364, 481, 450, 90, 390, 35, 452, 74, 196, 312, 142, 160, 143, 220, 483, 392, 443, 488, 79, 234, 68, 150, 356, 496, 69, 88, 177, 12, 288, 120, 222, 270, 441, 422, 103, 321, 65, 316, 448, 331, 117, 183, 184, 128, 323, 141, 467, 31, 172, 48, 95, 359, 239, 209, 398, 99, 440, 171, 86, 233, 293, 162, 121, 61, 317, 52, 54, 273, 30, 226, 421, 64, 204, 444, 418, 275, 263, 108, 10, 149, 497, 20, 97, 136, 139, 200, 266, 238, 493, 22, 17, 39]
	
	assert(quick_sort(ar), [10, 12, 17, 20, 22, 30, 31, 35, 39, 46, 48, 52, 54, 61, 64, 65, 68, 69, 74, 79, 86, 88, 90, 95, 97, 99, 103, 108, 117, 120, 121, 128, 136, 139, 141, 142, 143, 149, 150, 157, 160, 162, 171, 172, 177, 183, 184, 187, 196, 200, 204, 209, 220, 222, 226, 233, 234, 238, 239, 252, 263, 266, 270, 273, 275, 288, 293, 312, 316, 317, 318, 321, 323, 331, 356, 359, 364, 390, 392, 398, 406, 415, 418, 421, 422, 440, 441, 443, 444, 448, 450, 452, 467, 472, 481, 483, 488, 493, 496, 497])


end

it_sorts_an_array_with_one_element()
it_sorts_an_array_with_two_elements()
it_sorts_an_array_with_three_elements()
it_sorts_a_more_complicated_example()
it_sorts_another_complicated_example()
it_sorts_a_sorted_array()
it_sorts_a_parasitic_example()
it_sorts_a_fucking_ridiculous_example()

#partition(4,6)
#0 1 2 3 4 5 6
#1 2 3 5 7 9 8
#

puts "Passed"