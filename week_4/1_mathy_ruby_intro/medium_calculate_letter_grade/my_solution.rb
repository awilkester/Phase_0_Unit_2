# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by Myself.

# 1. Pseudocode

# What is the input? The initial input is an array that contains the scores of all the students
# What is the output? the output is a single letter grade that corresponds with the average of all the students' scores
# What are the steps needed to solve the problem? I need to 


# 2. Initial Solution

def get_grade(array)
	average = array.inject(:+)/array.count
	return "A" if average >= 90
	return "B" if average >= 80
	return "C" if average >= 70
	return "D" if average >= 60
	return "F"
end

# 3. Refactored Solution
=begin
def get_grade(array)
	scores_under_100 = Proc.new {|scores| scores <= 100 && scores > 0}
	scores = array.select(&scores_under_100)
  	average = scores.inject(:+)/scores.count
	
	return "A" if average >= 90
	return "B" if average >= 80
	return "C" if average >= 70
	return "D" if average >= 60
	return "F"
end
=end

# I wish I could have gotten proc to work to make sure the scores were over 0 and under 100, but for some reason proc wouldn't work properly. Otherwise my code is quite streamlined and efficient.

# 4. Reflection 

# I enjoyed this challenge because it reminded me a lot of a similar challanege on socrates a few weeks ago! It was fairly straightforward and very fun. In the future I hope to better understand proc to make sure I can set the right limits on the students' scores to prevent lower and upper bounds.



