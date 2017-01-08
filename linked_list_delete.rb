class Node
	attr_accessor :data
	attr_accessor :next_node

	def initialize(data, next_node)
		@data = data
		@next_node = next_node
	end

	def self.delete(head, position)
		return nil if head == nil || head.next_node == nil
		return head.next_node if position == 0

		prev = nil
		curr = head
		position.times do |i|
			prev = curr
			curr = curr.next_node
		end

		#curr is the node to be deleted
		prev.next_node = curr.next_node

		return head
	end
end

def assert(actual, expected)
	raise "actual: #{actual}, expected: #{expected}" unless expected == actual
end

def delete_it_accepts_nil_parameter
	assert(Node.delete(nil, 0), nil)
end

def delete_it_accepts_single_node
	head = Node.new(100, nil)

	assert(Node.delete(head, 0), nil)
end

def delete_it_deletes_the_head
	tail = Node.new(200, nil)
	head = Node.new(100, tail)

	assert(Node.delete(head, 0), tail)
end

def delete_it_deletes_a_middle_element
	tail = Node.new(200, nil)
	two = Node.new(50, tail)
	one = Node.new(25, two)
	head = Node.new(100, one)

	Node.delete(head, 2)
	assert(one.next_node.data, tail.data)
end

def delete_it_deletes_the_tail
	tail = Node.new(200, nil)
	two = Node.new(50, tail)
	one = Node.new(25, two)
	head = Node.new(100, one)

	Node.delete(head, 3)
	assert(two.next_node, nil)
end


delete_it_accepts_nil_parameter()
delete_it_accepts_single_node()
delete_it_deletes_the_head()
delete_it_deletes_a_middle_element()
delete_it_deletes_the_tail()

puts 'Passed'