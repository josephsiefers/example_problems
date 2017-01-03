class BigInt

	attr_accessor :digits

	def initialize(num_str=nil)
		@digits = [0]

		return if num_str.nil?

		@digits = num_str.split("").reverse.map(&:to_i)
	end

	def size
		@digits.length
	end

	def plus(b)
		c = BigInt.new

		carry = 0

		big, small = size >= b.size ? [@digits, b.digits] : [b.digits, @digits]

		c.digits = big.zip(small).map do |zipped|
			result = zipped.push(carry).compact.inject(0, :+)
			result >= 10 ? ((carry = 1) && (result - 10)) : ((carry = 0) && result)
		end

		#account for last carry
		c.digits << 1 if carry == 1	

		c
	end

	def to_s
		@digits.reverse.join("")
	end
end

def it_returns_the_size
	a = BigInt.new("1")

	puts "it_returns_the_size:"
	raise "Should be 1: #{a.size}" unless a.size == 1
	puts "Success"
end

def it_initializes_to_zero
	a = BigInt.new

	puts "it_initializes_to_zero:"
	raise "Should be 0: #{a.to_s}" unless a.to_s == "0"
	puts "Success"
end

def it_adds_one_plus_one
	a = BigInt.new("1")
	b = BigInt.new("1")

	c = a.plus(b)

	puts "it_adds_one_plus_one:"
	raise "Should be 2: #{c.to_s}" unless c.to_s == "2"
	puts "Success"
end

def it_adds_two_numbers_that_result_in_a_carry
	a = BigInt.new("9")
	b = BigInt.new("2")

	c = a.plus(b)

	puts "it_adds_two_numbers_that_result_in_a_carry:"
	raise "Should be 11: #{c.to_s}" unless c.to_s == '11'
	puts "Success"
end

def it_adds_a_and_b_with_a_having_more_digits_than_b
	a = BigInt.new("2222")
	b = BigInt.new("9")

	c = a.plus(b)

	puts "it_adds_a_and_b_with_a_having_more_digits_than_b:"
	raise "Should be 2231: #{c.to_s}" unless c.to_s == '2231'
	puts "Success"
end

def it_adds_a_and_b_with_b_having_more_digits_than_a
	a = BigInt.new("9")
	b = BigInt.new("2222")

	c = a.plus(b)

	puts "it_adds_a_and_b_with_b_having_more_digits_than_a:"
	raise "Should be 2231: #{c.to_s}" unless c.to_s == '2231'
	puts "Success"
end

def it_adds_a_and_b_with_a_carry_complication_along_a
	a = BigInt.new("292")
	b = BigInt.new("9")

	c = a.plus(b)

	puts "it_adds_a_and_b_with_a_carry_complication:"
	raise "Should be 301: #{c.to_s}" unless c.to_s == '301'
	puts "Success"
end

def it_adds_a_and_b_with_a_carry_complication_along_b
	a = BigInt.new("9")
	b = BigInt.new("292")

	c = a.plus(b)

	puts "it_adds_a_and_b_with_a_carry_complication:"
	raise "Should be 301: #{c.to_s}" unless c.to_s == '301'
	puts "Success"
end

def it_adds_very_large_numbers
	a = BigInt.new("90000002123121515151515")
	b = BigInt.new("22221111151151515151")

	c = a.plus(b)

	puts "it_adds_a_and_b_with_b_having_more_digits_than_a:"
	raise "Should be 90022223234272666666666: #{c.to_s}" unless c.to_s == '90022223234272666666666'
	puts "Success"	
end

def it_creates_a_new_object
	#a and b should be immutible
	a = BigInt.new("9")
	b = BigInt.new("2222")

	c = a.plus(b)

	d = c.plus(b)

	puts "it_creates_a_new_object:"
	raise "Should be 9: #{a.to_s}" unless a.to_s == '9'
	puts "Success"	
end

it_returns_the_size()
it_initializes_to_zero()
it_adds_one_plus_one()
it_adds_two_numbers_that_result_in_a_carry()
it_adds_a_and_b_with_a_having_more_digits_than_b()
it_adds_a_and_b_with_b_having_more_digits_than_a()
it_adds_a_and_b_with_a_carry_complication_along_a()
it_adds_a_and_b_with_a_carry_complication_along_b()
it_adds_very_large_numbers
it_creates_a_new_object()