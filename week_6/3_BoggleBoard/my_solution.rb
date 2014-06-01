# U2.W6: Create a BoggleBoard Class

# I worked on this challenge by myself.

# 2. Pseudocode

=begin 

* This code should accomplish a few specific functions:

	+Initiate a BoggleBoard class that takes in the variable "dice_grid" which is the actual Boggle board game grid.
	+Create a method in this class that allows you to create a word by inputting four distinct coordinates on the boggle board map. For example, variable([1,2],[2,1]...etc)
	+Create two methods that allows you to get a whole row or column from the boggle board map.
	+Create a method that allows you to get a specific letter from the boggle board map.
=end

# 3. Initial Solution
class BoggleBoard
	attr_reader :dice_griod

	def initialize(dice_grid)
		@dice_grid = dice_grid
		@word = []
	end

	def create_word(*coordinates)
		p @word = coordinates.map {|i| @dice_grid[i.first][i.last]}.join("")
	end

	def get_row(row)
   	@dice_grid[row]
	end

	def get_col(col)
	@dice_grid.map{|x| x[col]}
	end

end
 
# 4. Refactored Solution
class BoggleBoard
	def initialize(dice_grid)
		@dice_grid = dice_grid
		@word = []
		@letter = []
	end

	def create_word(*coordinates)
		p @word = coordinates.map {|i| @dice_grid[i.first][i.last]}.join("")
	end

	def get_row(row)
   		p @dice_grid[row]
	end

	def get_col(col)
		p @dice_grid.map{|x| x[col]}
	end

	def get_letter(r,c)
		p @letter = @dice_grid[r][c]
	end
end

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]

boggle_board = BoggleBoard.new(dice_grid)
p boggle_board.get_row(3)
p boggle_board.get_col(3)

# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:

boggle_board.create_word([1,2],[1,1],[2,1],[3,2]) == "dock"

p boggle_board.get_row(0) == ["b", "r", "a", "e"]
p boggle_board.get_row(1) == ["i", "o", "d", "t"]
p boggle_board.get_row(2) == ["e", "c", "l", "r"]
p boggle_board.get_row(3) == ["t", "a", "k", "e"]

p boggle_board.get_col(0) == ["b", "i", "e", "t"]
p boggle_board.get_col(1) == ["r", "o", "c", "a"]
p boggle_board.get_col(2) == ["a", "d", "l", "k"]
p boggle_board.get_col(3) == ["e", "t", "r", "e"]

boggle_board.get_letter(3,2) == "[c]"

def assert
	raise "Assertaion Failed." unless yield
end

assert {boggle_board.get_letter(2,3) == "r"}

assert {boggle_board.create_word([0,0], [1, 0], [3, 2], [3, 3])== "bike"}
assert {boggle_board.get_row(2) == ["e","c","l","r"]}
assert {boggle_board.get_col(3) == ["e","t","r","e"]}


# 5. Reflection 
=begin 

* This challenge was great. I really enjoyed strengthening my understanding of classes and reinforcing my knowledge of method creation. Specifically, I learned:

	+How to use attr_reader to make sure my assert methods would work properly -- ie to ensure they could read the attribute from the class
	+How to use asser to create functional driver code
	+How to build on previous knowledge of a boggle board program!
=end
