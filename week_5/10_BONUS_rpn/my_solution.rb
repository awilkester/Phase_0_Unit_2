# U2.W5: Implement a Reverse Polish Notation Calculator

# I worked on this challenge by Myself.

# 2. Pseudocode

# Useful methods and code:

# when /\d/ --> metacharacter that also behaves like a character class: this one selects for a digit

# .push --> pushes the given object(s) onto the end of an array 

# .pop --> removes the last element of an array, or if .pop(n), it removes the last n elements and returns them.

# .send --> Invokes the method identified by symbol, passing it any arguments specified. 

# 3. Initial Solution

=begin 
class RPNCalculator
	def evaluate(calculate_expression)
		evaluate_expression = calculation_expression.split
		operands = []
		evaluation = []

		evaluate_expression.each do |i|
			case i
				when /\d/
					evaluation.push(x.to_f)
				when "+", "-", "*", "**"
					operands = evaluation.pop(2)
					evaluation.push(operands[0].send(i,operands[1]))
			end
		end
		puts evaluation
	end
end
=end

# 4. Refactored Solution
class RPNCalculator
	def evaluate(number)
		evaluation = number.split(" ").inject([]) do |evaluation, i| #Splits the original expression and makes each element into an array, then invokes a loop
			if i =~ /\d+/ #Logic: if i is a metachracter that is both a digit and may occur one or more times (quantifier).
				evaluation << i.to_i # Loops through and pushes the digit(s) onto the end of the array
			else
				operator = evaluation.pop(2) 
				# When the function gets to an operator (ie anything thats not a digit), it will remove the last two digits and let this equal to a new operator variable
				evaluation << operator[0].send(i,operator[1])
				# Now evaluation will receive the result of whatever is done to these last two elements and the process will continue. 
			end
			# This function works well because it know that you may have more than 2 digits in a row, but the LAST two digits are what will give the needed result. 
		end
	p evaluation.pop # Removes the last element and displays it.
	end
end

# 1. DRIVER TESTS GO BELOW THIS LINE

describe RPNCalculator do
  let(:rpn) { RPNCalculator.new }

  describe '#evaluate' do
    it "expects 1 argument" do
      RPNCalculator.instance_method(:evaluate).arity.should eq 1
    end
    
    it "correctly evaluates '0'" do
      rpn.evaluate('0').should be_zero
    end

    it "correctly evaluates '-1'" do
      rpn.evaluate('-1').should eq -1
    end

    it "supports addition" do
      rpn.evaluate('1 1 +').should eq (1 + 1)
    end
    
    it "adds negative numbers" do
      rpn.evaluate('1 -1 +').should be_zero
    end

    it "supports multiplication" do
      rpn.evaluate('2 2 *').should eq (2 * 2)
    end
    
    it "subtracts in the correct order" do
      rpn.evaluate('5 10 -').should eq (5 - 10)
    end

    it "handles multiple operators in a row" do
      rpn.evaluate('1 2 3 4 + + +').should eq (1 + 2 + 3 + 4)
    end

    it "correctly combines addition and multiplication" do
      rpn.evaluate('1 2 + 3 4 + *').should eq ((2 + 1) * (4 + 3))
    end

    it "correctly combines multiplication, addition, and subtraction" do
      rpn.evaluate('20 10 5 4 + * -').should eq (20 - 10*(5 + 4))
    end

    it "handles arbitrary input" do
      a, b, c = Array.new(3) { rand(100) }
      
      rpn.evaluate("#{a} #{b} - #{c} *").should eq (a-b)*c
    end
  end

end

# 5. Reflection 
=begin

This challenge was extremely hard, but very rewarding! I learned lots of new functions and I also had to think deeply about how to construct my code -- BEFORE I actually did it. I really enjoyed the overall experience of creating a difficult class like this!

=end