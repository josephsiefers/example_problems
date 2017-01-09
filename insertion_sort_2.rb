def insertionSort(ar) 
   (1..(ar.length-1)).each do |j|
   		j.downto(1).each do |i|
   			break unless ar[i] < ar[i-1]
   			swap(ar, i, i-1)
   		end
   		puts ar.join(' ')
   end
   ar
end

def swap(ar, i, j)
	ar[i], ar[j] = [ar[j], ar[i]]
end

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

def it_sorts_an_unsorted_array
	ar = [1, 4, 3, 5, 6, 2]

	assert(insertionSort(ar), [1, 2, 3, 4, 5, 6])
end

it_sorts_an_unsorted_array()

puts "Passed"