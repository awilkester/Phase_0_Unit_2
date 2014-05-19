# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

#In this solution I will be creating a class called "Array" and then will specify defintions of methods that are attached to this class. This will allow me to create two methods: Array#pad and Array#pad!

# What is the input?
=begin
	+Two methods named Array#pad and Array#pad!
	+Each one accepts a minimum size, expressed as a non-negative integer, and an optional pad value as arguments.
	+Let minimum size be called min_size
	+Let there be a "value" that can be input to fill the padding, but otherwise it will be nil
	+The method needs to be non-destructive and return at least the array if the specified length is less than the original input array.
=end

# What is the output? (i.e. What should the code return?)
=begin
	+The output will be the modified array; it will add the spaces in the array as specified in the input and it can optionally fill these "nil" indexes with an object, string or other character if specified.
=end

# What are the steps needed to solve the problem?
=begin
	+Methods will require several parts:
		*Needs to check the length of the size of the array and return the original array if the size is >= the size specified in the input for the method.
		*Non-negative numbers will not be accepted, but (0) must return the original array as well.
		*Add unique way to use ! on one of the methods so that it modifies the underlying element.
		*If no value for the padding is inserted then the methods will output nil in the array padding.
=end
	
# 2. Initial Solution
=begin

# ATTEMPT 1:
class Array
	def pad!(min_size, value = nil)
		i = min_size - self.count # Take the minimum size and subtract the size of the original array. This gives us the amount of padding to be added (i). 
		i.times do #Repeats this i times.
     		self << value #Pushes the value variable i number of times to the end of the array.
		end
	
	end
  
  	def pad(min_size, value = nil)
  		#.clone is used clone is used to duplicate the original object, including its internal state.
  		self.clone.pad!(min_size, value)	
  	end
  	
end

[1, 4, 5, 6, 7, 3, 0].pad(10, "apple")

# Unfortunately this first method I tried does not fulfill most of the parameters required so I am back to drawing board on what to do!

# ATTEMPT 2
class Array
	def pad(x, y = nil)
		# We can eliminate the possibilities of negative array padding and the 0 condition by using a logic statement upfront.
		return dup if self.size >= x.abs
  		return self << Array.new( x-size, y ) if self.size < x.abs
	end
end
# This still doesn't work exactly as planned -- I need something simpler and more robust.
=end

# Another version ...
=begin
class Array
	def pad!(x, y = nil)
		# Initial logic to return self if the input size meets the restriction conditions
		if x <= self.count || x.class != Fixnum || 
			self
		else
			padding = x - self.count
			padding.times do
				self + y
			end
		end
		self
	end

	def pad(x, y = nil)
		self.clone.pad!(x, y)
	end
end
=end
# In all these versions I could not get the code to fulfill all the rspec requirements. Finally when I refactored (below) I was able to get things working as they should.

# 3. Refactored Solution
class Array
	def pad(num, value = nil)
		padding = num - self.length
		# Need to store the answer array in a separate unique variable so that no destruction occurs.
		answer_array = self.map {|x| x}
		padding.times { answer_array << value} if padding > 0
		answer_array
	end

	def pad!(num, value = nil)
		padding = num - self.length
		padding.times {self << value} if padding > 0
		self
	end
end

# 4. Reflection 

=begin
This challenge was one of the most difficult for the week in my opinion. I found it quite difficult to find the correct methods needed to solve the challenge and also to implement them in such a way as to fulfill all the requirements. I also found the driver code a bit confusing and it wasn't clear upfront what the conditions were. I spent 90% of the time debugging when in reality the code for this challenge was not all that difficult to understand the code up. 

What did I learn? A whole lot!
	+Array class and how to set default values
	+Pushing and adding solutions to an array
	+Using length logic 
	+Reinforced knowledge of .map
=end

