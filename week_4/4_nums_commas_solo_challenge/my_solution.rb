# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# 1. Pseudocode

# What is the input? Takes an integer as the input.
# What is the output? Returns a comma-separated integer as a STRING
# What are the steps needed to solve the problem? 
=begin 
First we need to loop through and convert the integer to a string, 
then we need to flip the string so that we can use a built in method to iterate
 through and split the string into groups of 3, add commas, then flip it back. 
 The reason we flip it is because when we count through from left to right to add commas, 
 we want to make sure we are lined up properly in spaces of 3. If we didn't do this then 
 we would have to assume we were on a whole hundreds digit.
=end

# Ruby methods:

# .to_s --> convert number into a string
# .chars --> Returns an array of the characters in a string. 
# .to_a --> convert character arrays into a single array


# 2. Initial Solution

def separate_comma(input)
	comma_value = input.to_s #conver the numnber sequence into a string
	comma_value = comma_value.chars #break apart this string into its component characters
	comma_value = comma_value.to_a #converts these individual characters into an array 
	comma_value = comma_value.reverse #reverses the number so we can count three digits each in order
	comma_value = comma_value.each_slice(3) #breaks apart the array into groups of 3
	
	# Maps out the array and joins each group with a comma in between, then reverses the 
	# array so its back in the correct order. 
	comma_value = comma_value.map(&:join).join(",").reverse 
	puts comma_value
end

separate_comma(123)

# 3. Refactored Solution

def separate_comma(input)
  input = input.to_s.chars.to_a.reverse.each_slice(3).map(&:join).join(",").reverse
  puts input
end

separate_comma(1238972)

# 4. Reflection

=begin
This was an awesome exercise. I mostly learned how to think out a process I needed to complete and
 how to apply my knoweledge. I also learned the method .map(:&join) method which is equivalent to 
 Ruby's built in map method given by: .map{ |x| x }.join(' ') }

 I am excited to keep learning more and to keep building out my method skills on Ruby!

 =end