class Node
	attr_accessor :data
	attr_accessor :next_node

	def initialize(data, next_node)
		@data = data
		@next_node = next_node
	end

	def self.reverse(head)
		return nil if head.nil?
		return head if head.next_node.nil?

		prev = nil
		curr = head
		nexty = curr.next_node

		while (nexty != nil)
			curr.next_node = prev
			prev = curr
			curr = nexty
			nexty = nexty.next_node
		end

		curr.next_node = prev

		return curr
	end
end

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

def it_returns_nil_if_head_nil
	assert(Node.reverse(nil), nil)
end

def it_returns_head_if_only_single_node
	head = Node.new(50, nil)

	assert(Node.reverse(head), head)
end

# (1) => (2)
# (2) => (1)
def it_reverses_a_list_with_two_elements
	tail = Node.new(25, nil)
	head = Node.new(50, tail)

	assert(Node.reverse(head), tail)
	assert(tail.next_node, head)
end
   
# (1) => (2) => (3)
# (1) <= (2)
# (1) <= (2) <= (3)
def it_reverses_a_list_with_three_elements
	tail = Node.new(25, nil)
	one = Node.new(75, tail)
	head = Node.new(50, one)

	assert(Node.reverse(head), tail)
	assert(tail.next_node, one)
end

def it_reverses_a_list_with_four_elements
	tail = Node.new(25, nil)
	two = Node.new(100, tail)
	one = Node.new(75, two)
	head = Node.new(50, one)

	assert(Node.reverse(head), tail)
	assert(two.next_node, one)
end

it_returns_nil_if_head_nil()
it_returns_head_if_only_single_node()
it_reverses_a_list_with_two_elements()
it_reverses_a_list_with_three_elements()
it_reverses_a_list_with_four_elements()

puts 'Passed'





# (3) => (2) => (1)

# (1) => (2) => (3) => (4)
# (4) => (3) => (2) => (1)