class TicTacToe
	attr_reader :board

	def initialize(board)
		@board = board
	end

	def find_winner
		#row or column victory
		victor = (check_rows(@board) || check_rows(@board.transpose))

		return victor unless victor.nil?

		#diagonal victory
		range = *(0..2)
		[range, range.reverse].each do |series|
			victor = check_diagonal(*series)

			return victor unless victor.nil?
		end

		return nil
	end

	def check_rows(rows)
		row = rows.find { |row| row[0] == row[1]  && row[0] == row[2] }

		return row.first unless row.nil?
	end

	def check_diagonal(left, middle, right)
		return @board[left][0] if @board[left][0] == @board[middle][1] && @board[middle][1] == @board[right][2]
	end
end

def assert(expectation, message)
	raise message unless expectation
end

def it_finds_a_row_victory
	board = [["X", "O", "X"], 
			 ["X", "X", "O"], 
			 ["X", "X", "X"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner == "X", "it_finds_a_row_victory: expected X")
	puts "Passed: it_finds_a_row_victory"
end

def it_finds_a_column_victory
	board = [["X", "O", "X"], 
			 ["X", "O", "X"], 
			 ["O", "X", "X"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner == "X", "it_finds_a_column_victory: expected X")
	puts "Passed: it_finds_a_column_victory"
end

def it_finds_the_top_left_to_bottom_right_diagonal_victory
	board = [["X", "O", "X"], 
			 ["X", "X", "O"], 
			 ["O", "X", "X"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner == "X", "it_finds_the_top_left_to_bottom_right_diagonal_victory: expected X")
	puts "Passed: it_finds_the_top_left_to_bottom_right_diagonal_victory"
end

def it_finds_the_bottom_left_to_top_right_diagonal_victory
	board = [["X", "O", "X"], 
			 ["X", "X", "O"], 
			 ["X", "X", "O"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner == "X", "it_finds_the_bottom_left_to_top_right_diagonal_victory: expected X")
	puts "Passed: it_finds_the_bottom_left_to_top_right_diagonal_victory"
end

def it_returns_nil_when_no_victory
	board = [["X", "O", "X"], 
			 ["X", "O", "X"], 
			 ["O", "X", "O"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner.nil?, "it_returns_nil_when_no_victory: expected nil")
	puts "Passed: it_returns_nil_when_no_victory"
end

def it_finds_an_early_victory
	board = [["X", "", "X"], 
			 ["X", "", ""], 
			 ["O", "O", "O"]
			]

	tic_tac_toe = TicTacToe.new(board)

	assert(tic_tac_toe.find_winner == "O", "it_returns_nil_when_no_victory: expected O")
	puts "Passed: it_finds_an_early_victory"
end

it_finds_a_row_victory()
it_finds_a_column_victory()
it_finds_the_top_left_to_bottom_right_diagonal_victory()
it_finds_the_bottom_left_to_top_right_diagonal_victory()
it_returns_nil_when_no_victory()
it_finds_an_early_victory()