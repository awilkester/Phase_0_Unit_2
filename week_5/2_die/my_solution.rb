# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# => Should take the form of a string input into the "labels" portion.
# => May also be an empty array.

# Output:
# => If empty array the class needs to be able to detect this and raise an arguement
# => If just a single string, then it should return just this.
# => If the input is an array of multiple strings then it needs to assign this to the @sides of class and then be able to randomly sort through a pick a "random" element from the original array, and then put this as the output of "@roll"
# Steps:


# 3. Initial Solution

class Die
  def initialize(labels)
  	if labels.empty?
  		raise ArgumentError.new("Must pass in at least one string")
	end	
	@sides = labels
  end

  def sides
  	@sides.count
  end

  def roll
  	@sides[rand(@sides.length)]
  end
end

# 4. Refactored Solution

class Die
  def initialize(labels)
  	if labels.empty?
  		raise ArgumentError.new("Must pass in at least one string")
	end	
	@sides = labels
  end

  def sides
  	@sides.count
  end

  def roll
  	@sides[rand(@sides.length)]
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
describe Die do
  describe '#initialize' do
    it 'expects a single argument' do
      Die.instance_method(:initialize).arity.should eq 1
    end
    # Driver code is making sure that intialize method is receiving only a single argument (single input).

    it 'raises an ArgumentError if list of labels is empty' do
      expect {
        Die.new([])
      }.to raise_error(ArgumentError)
    end
    # Driver code checking to make sure that an Argument Error is raised if an empty array is entered as the input.
  end


  describe '#sides' do
    it 'expects no arguments' do
      Die.instance_method(:sides).arity.should be_zero
      # Driver code is checking the sides portion of the class to make sure that it does not have any input. Only the initialize portion of the class should accept an input.
    end

    it 'returns the number of sides given on initialization' do
      length = 1 + rand(100)
      sides = Array.new(length) { 'A' }
      die = Die.new(sides)

      die.sides.should eq length
      # Driver code is making sure that @sides returns the length of the initial input. IE its verifying that sides is equal to the size of the input array as stated in the challenge prompt.
    end
  end


  describe '#roll' do
    it 'expects no arguments' do
      Die.instance_method(:roll).arity.should be_zero
    end
	# Driver code is checking the sides portion of the class to make sure that it does not have any input. Only the initialize portion of the class should accept an input
    it 'returns a single letter if one label is passed in' do
      random_letter = ('A'..'Z').to_a[rand(26)]
      die = Die.new([random_letter])

      Array.new(100) { die.roll }.should eq Array.new(100) { random_letter }
    end
    # Driver code checking that if the input array only has a single element, then this single element is the output of the roll method in the class.
    it 'returns every possible letter for a sufficiently large number of rolls' do
      possible_values = ('A'..'Z').to_a.shuffle.first(15)

      die = Die.new(possible_values)

      output = Array.new(10000) { die.roll }.uniq

      output.sort.should eq possible_values.sort
    end
    # Driver code checking to make sure that our code isn't excluding any possible values -- IE is our code procuding an output that is sufficiently random, but inclusive. 
  end
end

# 5. Reflection 
=begin 
As with the first die challenge, I really enjoyed the logic behind this task. At first I was worried it would take just as long as the first one (which I thought had a lot of unnecessary driver material), but in actuality I finished this challenge much faster.

Moving forward, I would still like to better understand the instances of each method in a class. I don't fully understand why we have to use the @ sign yet with classes. I need to spend more time fundamentally understanding out classes work in Ruby.
=end