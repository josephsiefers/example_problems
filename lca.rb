class Node
	attr_reader :val
	attr_reader :left
	attr_reader :right

	def initialize(val, left, right)
		@val = val
		@left = left
		@right = right
	end

	def lca(val_one, val_two)
		return nil if @left.nil? || @right.nil?

		return @left.lca(val_one, val_two) if val_one < @val && val_two < @val

		return self if val_one < @val && @val < val_two && @left.find_node(val_one) && @right.find_node(val_two)

		return @right.lca(val_one, val_two) if @val < val_one && @val < val_two
	end

	def find_node(val)
		return self if @val == val

		return @left.find_node(val) if !@left.nil? && val < @val
		return @right.find_node(val) if !@right.nil? && @val < val
		return nil
	end
end

def assert(test_name, actual, expected)
	puts "#{test_name}:"

	if actual != expected
		puts "Failed: expected #{expected} but was #{actual}"
	else
		puts "Passed"
	end
end

#     10
#    /  \
#   5   12
#
def it_finds_trivial_root_node
	left = Node.new(5, nil, nil)
	right = Node.new(12, nil, nil)
	root = Node.new(10, left, right)

	assert("it_finds_trivial_root_node", root.find_node(10), root)
end

it_finds_trivial_root_node()

#     10
#    /  \
#   5   12
#
def it_finds_leaf_node
	left = Node.new(5, nil, nil)
	right = Node.new(12, nil, nil)
	root = Node.new(10, left, right)

	assert("it_finds_leaf_node", root.find_node(5), left)
end

it_finds_leaf_node()

#     10
#    /  \
#   5   12
#        \
#         15
#          \
#           20
def it_finds_deeply_nested_leaf_node
	left = Node.new(5, nil, nil)
	two = Node.new(20, nil, nil)
	one = Node.new(15, nil, two)
	right = Node.new(12, nil, one)
	root = Node.new(10, left, right)

	assert("it_finds_deeply_nested_leaf_node", root.find_node(20), two)
end

it_finds_deeply_nested_leaf_node()

#     10
#    /  \
#   5   12
#
def it_returns_nil_if_node_not_found
	left = Node.new(5, nil, nil)
	right = Node.new(12, nil, nil)
	root = Node.new(10, left, right)

	assert("it_returns_nil_if_node_not_found", root.find_node(16), nil)
end

it_returns_nil_if_node_not_found()


#     10
#    /  \
#   5   12
#
def it_finds_trivial_lca
	left = Node.new(5, nil, nil)
	right = Node.new(12, nil, nil)
	root = Node.new(10, left, right)

	assert("it_finds_trivial_lca", root.lca(5, 12).val, 10)
end

#it_finds_trivial_lca()

#     10
#    /  \
#   5   12
#      /  \
#     11  15
#
def it_finds_first_level_lca
	one = Node.new(5, nil, nil)
	three = Node.new(11, nil, nil)
	four = Node.new(15, nil, nil)
	two = Node.new(12, three, four)
	root = Node.new(10, one, two)

	assert("it_finds_first_level_lca", root.lca(11, 15).val, 12)
end

#it_finds_first_level_lca()


#     10
#    /  \
#   5   12
#      /  \
#     11  15
#
def it_returns_nil_if_no_lca
	one = Node.new(5, nil, nil)
	three = Node.new(11, nil, nil)
	four = Node.new(15, nil, nil)
	two = Node.new(12, three, four)
	root = Node.new(10, one, two)

	assert("it_returns_nil_if_no_lca", root.lca(11, 16), nil)
end

it_returns_nil_if_no_lca()