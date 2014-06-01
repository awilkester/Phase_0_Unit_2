# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge by myself.

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode

=begin 
* This challenge asks us to create a pez dispenser code. This code will be made up of a class with different types of variables. Specifically we should:
	+ Create a new class called "PezDispenser"
	+ Initialize the class
	+ Create methods: 
		> add_pez
		> see_all_pez
		> pez_count
		> get_pez
=end

# 3. Initial Solution

class PezDispenser
	
		attr_reader :flavors

	def initialize (flavors)
		@flavors = flavors
		p "A new pez dispenser has been created. You have #{self.pez_count} pez!"
	end

	def add_pez type
		@flavors.unshift(type)
		p "Adding a #{type} pez."
	end

	def see_all_pez
		p "Here's a look inside the dispenser:" 
		p @flavors
	end

	def pez_count
		count = @flavors.count
		p "Now you have #{count}"
	end

	def get_pez
		p "Oh, you want one do you? (yes or no)"
		user_response = get.chomp
		if user_response == "yes"
			@flavor.shift
			p "The pez flavor you got is: #{dispensed_flavor}"
		else
			p "Oh, okay, evermind then, NO PEZ FOR YOU."
		end
	end
end

# 4. Refactored Solution
#  Stephen Estrada is going to attempt to refactor for the Refactoring challenge this week.

class PezDispenser
	
		attr_reader :flavors

	def initialize (flavors)
		@flavors = flavors
	end

	def add_pez type
		@flavors.unshift(type)
	end

	def see_all_pez
		@flavors
	end

	def pez_count
		@flavors.count
	end

	def get_pez
		@flavors.shift
	end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
def assert
	raise "Assertion Failed." unless yield
end

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)

assert {super_mario.pez_count == 9}

puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  

assert {super_mario.see_all_pez.all? {|pez| flavors.include?(pez)}}

puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor

assert {super_mario.see_all_pez[0] == "purple"}
assert {super_mario.pez_count == 10}

puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"

assert {super_mario.see_all_pez.include?("purple") == false}
assert {super_mario.pez_count == 9}

puts "Now you have #{super_mario.pez_count} pez!"

# 5. Reflection 

=begin

This exercise was very stimulating and I enjoyed figuring out how to build out a robust class all on my own.

In terms of lessons learned, I found out how to:

	+ Create a class and methods all on my own
	+ Create a program from driver code specifications
	+ Use pseudocode to map out my methods, inputs and outputs first
	+ Use assertions to check my code!

Overall, I really enjoyed this exercise and found it a very valuable learning experience.

=end
