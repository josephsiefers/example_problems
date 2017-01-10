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

def it_sorts_yet_another_ridiculous_example
	ar = [193, 710, -326, -212, 630, 434, -378, 728, 25, 702, -324, 719, -546, -754, -256, -254, 268, -718, -145, -28, 12, 125, 7, -565, 54, 594, 301, -267, 776, 532, 141, -555, -453, 663, -556, -607, 58, 734, 584, -632, 202, -304, 460, -405, 17, -97, 399, -551, 273, 400, 298, 699, -472, 275, 16, -741, 623, -78, 768, -421, 271, -264, 223, -288, 239, -502, 518, -337, -450, 539, 327, 77, 285, 73, 784, 778, -196, -707, -174, 654, 190, 683, 375, 744, 40, 749, 133, -122, 752, 404, -34, 456, -384, 671, -255, -745, 496, 626, -352, 347, -364, -563, 515, -321, -382, 389, -16, 348, -419, -370, 645, 648, -234, -676, 799, 138, -739, -592, 165, 659, 13, -475, 79, -553, -353, -169, 134, 513, -641, 151, 535, 325, 259, -672, 733, -376, 603, -580, -714, 546, -107, 439, -306, 462, -432, 560, -48, 8, -769, -363, -360, -47, -435, -94, 480, 721, -599, -493, -733, -69, 219, 674, -751, 419, -24, 323, -574, 50, -679, 670, 558, 310, -26, 413, 361, -355, 694, -348, -70, -215, -204, -708, -478, 100, 438, 368, 390, -618, 533, 262, 152, -722, 145, -689, -600, 762, -422, 43, -247, -216, -379, 321, 526, -396, 716, 452, 790, 83, 785, 493, -765, 553, -411, -33, -184, 569, 743, -703, -383, 89, -65, -500, 345, -428, -38, 46, 647, 724, -30, 364, -239, -68, 163, 32, 740, -316, -644, -698, -305, 206, -488, -111, -40, -209, -762, 382, 295, 741, -180, 291, 365, -654, -731, 177, -294, -498, -275, 673, 747, -685, -506, 218, -12, -198, -137, -572, 635, -307, 281, -5, -311, 566, 508, 381, 199, 672, -102, 617, 108, -621, 393, 94, 720, 66, -385, -150, 144, -388, 505, 150, 342, -627, 588, -142, 405, 472, -486, 629, 482, 712, 498, -281, 510, 286, 440, 380, 605, -242, -577, 751, 111, -681, 476, 258, 367, -64, -445, -540, -214, 409, -162, 781, 38, -690, 353, 486, -530, 633, 339, -323, -717, -328, 360, -159, 611, 478, 451, -300, 668, -51, 461, 48, 49, 658, -544, 112, -783, 127, -331, -394, 146, 294, 753, -227, 436, 320, -158, -798, -634, 175, -371, -266, 408, 166, -425, 178, -277, -408, 507, -31, -315, -289, -244, -119, -521, -318, -343, 524, -582, -25, 171, 764, -128, 242, 184, -766, -293, -367, -423, -271, -132, 512, 544, -206, -648, 331, -192, -138, 665, 29]

	asert(quick_sort(ar), [58, 66, 73, 77, 79, 83, 89, 94, 100, 108, 111, 112, 125, 127, 133, 134, 138, 141, 144, 145, 146, 150, 151, 152, 163, 165, 166, 171, 175, 177, 178, 184, 190, 193, 199, 202, 206, 218, 219, 223, 239, 242, 258, 259, 262, 268, 271, 273, 275, 281, 285, 286, 291, 294, 295, 298, 301, 310, 320, 321, 323, 325, 327, 331, 339, 342, 345, 347, 348, 353, 360, 361, 364, 365, 367, 368, 375, 380, 381, 382, 389, 390, 393, 399, 400, 404, 405, 408, 409, 413, 419, 434, 436, 438, 439, 440, 451, 452, 456, 460, 461, 462, 472, 476, 478, 480, 482, 486, 493, 496, 498, 505, 507, 508, 510, 512, 513, 515, 518, 524, 526, 532, 533, 535, 539, 544, 546, 553, 558, 560, 566, 569, 584, 588, 594, 603, 605, 611, 617, 623, 626, 629, 630, 633, 635, 645, 647, 648, 654, 658, 659, 663, 665, 668, 670, 671, 672, 673, 674, 683, 694, 699, 702, 710, 712, 716, 719, 720, 721, 724, 728, 733, 734, 740, 741, 743, 744, 747, 749, 751, 752, 753, 762, 764, 768, 776, 778, 781, 784, 785, 790, 799])
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