# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

$boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Write a method that takes a row number and returns all the elements in the row.

# Pseudocode

# In this part we will be writing a method that accesses the row specified in the boggle board. This is quite simple to do and only requires one in-built Ruby method, .map, along with the knowledge that $ specifies a global variable. 

# Initial Solution

def get_row(row)
   	$boggle_board[row]
end

get_row(1) #=>  ["i", "o", "d", "t"]

# Refactored Solution

# None necessary.

# DRIVER TESTS GO BELOW THIS LINE

p get_row(0) == $boggle_board[0]
p get_row(1) == $boggle_board[1]
p get_row(2) == $boggle_board[2]
p get_row(3) == $boggle_board[3]

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode

# Initial Solution
def get_col(col)
	$boggle_board.map{|x| x[col]}
end

# Refactored Solution

# None necessary. 

# DRIVER TESTS GO BELOW THIS LINE

p get_row(0) == $boggle_board.map{|x| x[0]}
p get_row(1) == $boggle_board.map{|x| x[1]}
p get_row(2) == $boggle_board.map{|x| x[2]}
p get_row(3) == $boggle_board.map{|x| x[3]}

#-------------------------------------------------------------------------------

# Challenge Reflection 

=begin 
This challenge was not very difficult because it was so simple and because DBC provided essentially all of the code. I don't really have anything to say except that I leanred how to use a global variable with $ and that I reconfirmed how to use .map.
=end


