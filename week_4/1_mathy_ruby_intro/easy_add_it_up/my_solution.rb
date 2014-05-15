# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by Myself.

# 1. Pseudocode

# What is the input? input is an array.
# What is the output? it should return one value "total" that is the summation of all the elements in the array.
# What are the steps needed to solve the problem? I need to create a method that accepts one input, then goes through this input (which should be an array) and sums up the value of each element and then returns this total to the user.


# 2. Initial Solution

#Total Method
def total(array)
  total = 0
  array.each do |i|
    total += i
  end
  total
end

#sentence_maker Method
def sentence_maker(stringarray)
	sentence_maker = stringarray.join(" ")
	sentence_maker << "."
	sentence_maker = sentence_maker.capitalize
	sentence_maker
end
# 3. Refactored Solution

#For total method	
	def total(array)
		array.inject(:+)
	end

#For sentence_maker method	
	def sentence_maker(stringarray)
	 	stringarray.first.capitalize!
	 	stringarray.join(" ") + "."
	end

# 4. Reflection 
=begin
	I really enjoyed this first exercise. It allowed me to dip my toes back into Ruby without feeling like I was totally lost. For the most part I had trouble figuring out how to refactor. Doing some online research helped me to discover a much simpler way to do things. 

=end

