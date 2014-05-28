# U2.W6: Testing Assert Statements

# I worked on this challenge by myself.

# 1. Review the simple assert statement

=begin 
def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }
=end 

# 2. Pseudocode what happens when the code above runs

# When this code runs the following prompt appears: Assertion failed! Runtime Error due to line 14, which corresponds with name == "billybob"

# So, this method will check to make sure that the name corresponds with its value. 

# First, it checks asset { name == "bettysue" }; since the variable name was set to this string, no "Assertion Failed!" prompt is issued.

# Next, it checks the next assert method and finds that billybob d.n.e. bettysue, so it raises the "assertion failed!" string

# Yield executes the code within the block provided to the method.

# 3. Copy your selected challenge here

class CreditCard
	def initialize cc_num
		@cc_num = cc_num
		unless cc_num.to_s.length == 16
			raise ArgumentError.new("Must enter a 16 digit credit card number.")
		end
	end

	def check_card
		p (@cc_num = @cc_num.to_s.chars.map(&:to_i).map.each_with_index {|v,i| if i % 2 == 0 then v*2 else v end}.to_s.chars.map(&:to_i).inject(:+) % 10 == 0) ? true : false
	end
end

# 4. Convert your driver test code from that challenge into Assert Statements

def assert
  raise "Assertion failed!" unless yield
end

card_false = CreditCard.new(6473859485784631)
card_false = card_false.check_card
assert { card_false == false }  # This is an invalid CC number under the Luhn Algorithm, so the output should be FALSE.

card_true = CreditCard.new(4563960122001999)
card_true = card_true.check_card
assert { card_true == true }  # This is a VALID CC number under the Luhn Algorithm, so the output should be TRUE.

# 5. Reflection
=begin 

This was a fun first look at using assertions. I was able to get my credit card code to run with assertions with no problems! Looking forward to continuing to implement this tool in test driving.

=end