class Node
	attr_accessor :data
	attr_accessor :next_node

	def initialize(data, next_node)
		@data = data
		@next_node = next_node
	end

	def self.compare(head_one, head_two)
		return false if head_one.nil? || head_two.nil?
		return false if head_one.data != head_two.data

		next_one = head_one.next_node
		next_two = head_two.next_node

		while(!next_one.nil? && !next_two.nil?) do
			return false if next_one.data != next_two.data

			next_one = next_one.next_node
			next_two = next_two.next_node
		end

		(next_one.nil? && next_two.nil?)
	end
end

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

#nil
#nil
def it_returns_false_if_both_nil
	assert(Node.compare(nil, nil), false)
end

# nil
# (1) => nil
def it_returns_false_if_one_head_nil
	head_one = Node.new(1, nil)
	assert(Node.compare(head_one, nil), false)
end

def it_returns_true_when_both_heads_match
	head_one = Node.new(1, nil)
	head_two = Node.new(1, nil)

	assert(Node.compare(head_one, head_two), true)
end

def it_returns_false_when_heads_do_not_match
	head_one = Node.new(1, nil)
	head_two = Node.new(2, nil)

	assert(Node.compare(head_one, head_two), false)
end

def it_returns_false_when_the_lists_do_not_match_in_length
	head_one = Node.new(1, nil)

	tail_two = Node.new(2, nil)
	head_two = Node.new(1, tail_two)

	assert(Node.compare(head_one, head_two), false)
end

def it_returns_true_when_the_lists_match_in_length_and_match_in_data
	tail_one = Node.new(2, nil)
	head_one = Node.new(1, tail_one)

	tail_two = Node.new(2, nil)
	head_two = Node.new(1, tail_two)

	assert(Node.compare(head_one, head_two), true)	
end

def it_returns_false_when_the_lists_match_in_length_and_differ_in_data
	tail_one = Node.new(3, nil)
	head_one = Node.new(1, tail_one)

	tail_two = Node.new(2, nil)
	head_two = Node.new(1, tail_two)

	assert(Node.compare(head_one, head_two), false)	
end

def it_returns_false_when_longer_lists_differ_in_length

	tail_one = Node.new(3, nil)
	one_one = Node.new(2, tail_one)
	head_one = Node.new(1, one_one)

	tail_two = Node.new(2, nil)
	head_two = Node.new(1, tail_two)

	assert(Node.compare(head_one, head_two), false)	
end

def it_returns_false_when_longer_lists_match_in_length_and_differ_in_data

	tail_one = Node.new(4, nil)
	one_one = Node.new(2, tail_one)
	head_one = Node.new(1, one_one)

	tail_two = Node.new(3, nil)
	one_two = Node.new(2, tail_two)
	head_two = Node.new(1, one_two)

	assert(Node.compare(head_one, head_two), false)	
end

def it_returns_true_when_longer_lists_match_in_length_and_match_in_data

	tail_one = Node.new(3, nil)
	one_one = Node.new(2, tail_one)
	head_one = Node.new(1, one_one)

	tail_two = Node.new(3, nil)
	one_two = Node.new(2, tail_two)
	head_two = Node.new(1, one_two)

	assert(Node.compare(head_one, head_two), true)	
end


it_returns_false_if_both_nil()
it_returns_false_if_one_head_nil()
it_returns_true_when_both_heads_match()
it_returns_false_when_heads_do_not_match()
it_returns_false_when_the_lists_do_not_match_in_length()
it_returns_true_when_the_lists_match_in_length_and_match_in_data()
it_returns_false_when_the_lists_match_in_length_and_differ_in_data()
it_returns_false_when_longer_lists_match_in_length_and_differ_in_data()
it_returns_true_when_longer_lists_match_in_length_and_match_in_data()

puts "Passed"