#   0 1 j
# 0 m n
# 1 a b
# i

#m -> n
#| \ 
#a  b

#m <- n
#   / |
# a   b

# m   n
# | /
# a -> b

# m    n
#    \ |
# a <- b

#---
#   0 1 2 j
# 0 m n k
# 1 a b c
# 2 d e f
# i



class Boggle
	attr_reader :board

	def initialize(board)
		@board = board
		@dictionary = ['a', 'an', 'ban', 'man', 'bank']
	end

	def find_all_words
		result = []
		(0..(rows-1)).each do |i|
			(0..(columns-1)).each do |j|
				result.concat(search("", [], 0, i, j))
			end
		end

		#result.select! { |word| @dictionary.include?(word) }
		result
	end

	def search(word, visited, depth, i, j)
		return [] unless (i >= 0 && i < rows)
		return [] unless (j >= 0 && j < columns)
		return [] if visited.include?([i, j])
		
		letter = @board[i][j]
		visited = [*visited, [i, j]]
		new_word = "#{word}#{letter}"

		result = @dictionary.include?(new_word) ? new_word : nil

		depth=depth+1
		#depth_indicator = depth.times.collect { '>' }.join('')
		#puts "#{depth_indicator} Visiting: (#{i}, #{j}), #{letter}, #{new_word}"
		#puts "#{depth_indicator} Visited: #{visited}"
		

		# (i-1, j-1)  (i-1, j)  (i-1, j+1)
		# (i, j-1)    (i, j)    (i, j+1)
		# (i+1, j-1)  (i+1, j)  (i+1, j+1)

		[result].concat([search(new_word, visited, depth, i-1, j-1),
			search(new_word, visited, depth, i-1, j),
			search(new_word, visited, depth, i-1, j+1),
			search(new_word, visited, depth, i, j-1),
			search(new_word, visited, depth, i, j+1),
			search(new_word, visited, depth, i+1, j-1),
			search(new_word, visited, depth, i+1, j),
			search(new_word, visited, depth, i+1, j+1)	
		]).flatten.compact
	end

	def rows
		@board.first.length
	end

	def columns
		@board.length
	end
end

def assert(expectation, message)
	raise message unless expectation
end

def it_finds_a_one_letter_word
	boggle = Boggle.new([["m", "n"], ["a", "b"]])

	words = boggle.find_all_words

	assert(words.include?("a"), "One letter word not found: a")
	puts "Passed: it_finds_a_one_letter_word"
end

def it_finds_a_two_letter_word
	boggle = Boggle.new([["m", "n"], ["a", "b"]])

	words = boggle.find_all_words

	assert(words.include?("an"), "Two letter word not found: an")
	puts "Passed: it_finds_a_two_letter_word"
end

def it_finds_a_three_letter_word
	boggle = Boggle.new([["m", "n"], ["a", "b"]])

	words = boggle.find_all_words

	assert(words.include?("man"), "Three letter word not found: man")
	puts "Passed: it_finds_a_three_letter_word"
end

def it_finds_a_four_letter_word
	boggle = Boggle.new([["m", "n", "k"], ["a", "b", "c"], ["d", "e", "f"]])

	words = boggle.find_all_words

	assert(words.include?("bank"), "Four letter word not found: bank")
	puts "Passed: it_finds_a_four_letter_word"
end

def it_excludes_words_not_in_the_dictionary
	boggle = Boggle.new([["m", "n", "k"], ["a", "b", "c"], ["d", "e", "f"]])

	words = boggle.find_all_words

	assert(!words.include?("mnad"), "Incorrect word found: mnad")
	puts "Passed: it_excludes_words_not_in_the_dictionary"
end

it_finds_a_one_letter_word()
it_finds_a_two_letter_word()
it_finds_a_three_letter_word()
it_finds_a_four_letter_word()
it_excludes_words_not_in_the_dictionary()
