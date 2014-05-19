# U2.W4: Review and Refactor: Pad an Array

# I worked on this challenge by Myself.

# What I learned from this solution
# I learned about .dup method
# Discovered that they both do same thing
# The part I loved most was {self.push(v)} or {self << v}.	
# Copy solution here:

# Ernie's Code

class Array
  def pad!(n, v = nil)
  	(n - self.length).times {self.push(v)}
  	self
  end
  def pad(n, v = nil)
  	self.dup.pad!(n, v)
  end

# 2. Second Person's solution I liked
# Copy solution here:

class Array

	def pad(int, str=nil)
		diff = int - self.length
		ans = self.map {|num| num}
		diff.times {ans << str}
		ans
	end

	def pad!(int, str=nil)
		diff = int - self.length
		diff.times { self << str}
		self
	end

end



# 3. My original solution:

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


# 4. My refactored solution:

class Array
  def pad!(num, value = nil)
  	(num - self.length).times {self.push(value)}
  	self
  end
  def pad(num, value = nil)
  	self.dup.pad!(n, value)
  end

# 5. Reflection

=begin 
I found this exercise EXTERMELY useful! I loved going through others' codes and seeing how they were able to process the problem even faster and more efficiently. The best one in my opinion was Ernie's code, since it was so simple and clean. It took me a while to figure out exactly what he did -- once I did I was astonished! So simple! In the future I need to try to employ more effective ruby methods to build a robust, clean and super efficient code like him :)
=end
