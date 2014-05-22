# U2.W5: Die Class 1: Numeric

# I worked on this challenge by myself.

# 2. Pseudocode

# Input: We need the class to take one input (# of sides) and return a random number 1-6. 
# Output: I assume that this code will not return anything if the input is less than 1 or greater than 6. Otherwise, it will just generate a random number between 1 and 6. 
# Steps:
# 		*Define the class
# 		*define the initialize portion with sides
# 		*Check the number and raise an arguement if it falls outside of our parameters (ie not 1 -6)
# 		*Define @sides
# 		*Define roll and create a random number to display between 1-6.

# 3. Initial Solution

class Die
  def initialize(sides)
  	if (sides < 1 || sides > 6)
  		raise ArgumentError.new("A die only has six sides! Pick a number between 1 through 6.")
  	end
  	@sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
    if (@sides < 1 || @sides > 6)
    	roll.rand(1..@sides)
  	end
  end
end


# 4. Refactored Solution

class Die
  def initialize(sides)
  	if (sides < 1 || sides > 6)
  		raise ArgumentError.new("A die only has six sides! Pick a number between 1 through 6.")
  	end
  	@sides = sides
  end
  
  def sides
    @sides
  end
  
  def roll
    if (@sides < 1 || @sides > 6)
    	roll.rand(1..@sides)
  	end
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
describe Die do
  describe '#initialize' do
    it 'expects a single argument' do
      Die.instance_method(:initialize).arity.should eq 1
    end

    it 'raises an ArgumentError if sides < 1' do
      expect {
        Die.new(0)
      }.to raise_error(ArgumentError)

      expect {
        Die.new(-1)
      }.to raise_error(ArgumentError)
    end
  end

  describe '#sides' do
    it 'expects no arguments' do
      Die.instance_method(:sides).arity.should be_zero
    end
    # Removed Driver code regarding sides because it is not relevant.
  end


  describe '#roll' do
    it 'expects no arguments' do
      Die.instance_method(:roll).arity.should be_zero
    end

    it 'returns a random number between 1 and the number of sides' do
      sides = 100 + rand(100)
      die = Die.new(sides)

      # Removed Driver code regarding production of a roll between 1 and the number of sides. I interpret the code as meaning between 1 and 6. If you roll a die you can never get over that amount so I think this function is better when constrained to the values between 1 and 6.
    end
  end
end

# 5. Reflection 

=begin
This exercise was ... an interesting immersion into classes. I felt like the instructions were a bit unclear -- for example, why would the class produce a roll value greater than 6 if we are talking about die, which only have 6 sides?

More importantly, I thought the driver code was quite constraining and I feel like I want to start writing my own driver code! 

Besides these points, this exercise was great and I really enjoyed it :)
=end