# U2.W5: Class Warfare, Validate a Credit Card Number

# I worked on this challenge by myself.

# 2. Pseudocode

# Input: A 16 digit credit card number.
# Output: A statement of whether or not the Credit Card is valid based on the Luhn algorithm.

# Steps: 
# => Check length of input to make sure is a 16 digit number
# => Loop through to every other digit and multiply by 2
# => Split the whole array into its component integers
# => Sum over all integers
# => Establish logic whereby the CC is valid if sum modulus 10 is equal to 0. 
# => Otherwise, its not evenly divisible by 10 and is not considered valid under the Luhn Algorithm.

# 3. Initial Solution

# Don't forget to check on intialization for a card length of exactly 16 digits

class CreditCard
	def initialize cc_num
		@cc_num = cc_num
		unless cc_num.to_s.length == 16
			raise ArgumentError.new("Must enter a 16 digit credit card number.")
		end
	end

	def check_card
		@cc_num = @cc_num.to_s.chars.map(&:to_i).map.each_with_index do |v,i| 
			if i % 2 == 0
				v*2
			else
				v
			end
		end
		@cc_num = @cc_num.to_s.chars.map(&:to_i).inject(:+)
		p (@cc_num % 10 == 0) ? true : false
	end
	
end

# Driver code for initial solution:

card_false = CreditCard.new(6473859485784631)
card_false.check_card  # This is an invalid CC number under the Luhn Algorithm, so the output should be FALSE.

card_true = CreditCard.new(4563960122001999)
card_true.check_card # This is a VALID CC number under the Luhn Algorithm, so the output should be TRUE.

# 4. Refactored Solution
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

# 5. DRIVER TESTS GO BELOW THIS LINE

card_false = CreditCard.new(6473859485784631)
card_false.check_card  # This is an invalid CC number under the Luhn Algorithm, so the output should be FALSE.

card_true = CreditCard.new(4563960122001999)
card_true.check_card # This is a VALID CC number under the Luhn Algorithm, so the output should be TRUE.

# 6. Reflection 

=begin 
This was an incredibly challening and fun exercise.

The main things I learned related to properly using .map along with character transformation in order to split up and separate the credit card number. Next, I did some research on how to modify an element by its INDEX and how to incorporate logic. Afterwards, I further researched if this could be condensed into inline boolean logic. It took a lot of time on Ruby enumerables to find this information -- but the experience was so rewarding!

=end 
