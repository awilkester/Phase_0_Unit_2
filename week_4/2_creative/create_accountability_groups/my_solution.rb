# U2.W4: Create Accountability Groups

# I worked on this challenge with Stephen Estrada.

# 2. Pseudocode

# Input: Array that includes the names of all the students in my cohort to separate into accountability groups.
# Output: Should include 6 sets of four students each that are randomized into accountability groups. 
# Steps: Randomize the cohort, assign each student to a group, reassign students to a new group that does not include people they were with before

# 3. Initial Solution

my_DBC_cohort = [ "Rootul Patel", "Hilary Barr" , "Alan Florendo" , "Cassie Moy" , "Stephen Craig Estrada", "Austin Hay", "Anthony Edwards Jr." , "John Berry" , "Farheen Malik" , "Daniel Deepak" , "RJ Arena", "Justin Lee" , "Michael Weiss", "David Sin" , "Julius Jung" , "Fahia Mohamed", "Molly Huerster" ,"Eric Hou" , "Avi Fox-Rosen" ,"Joel Yawili" , "Dylan Richards" ,"Kaitlyn La" ,"Derek Siker" , "Dylan Krause", "test1", "test2", "test3"]

def accountability_group_generator(cohort_list, n)
	accountability_groups = Array.new
	list_length = cohort_list.length/n
	i = 0
	k = 0

	cohort_list = cohort_list.sort_by {rand} #Sufficiently randomize the list.
	cohort_list.each_slice(n).to_a #Split the list into groups of n.
	
	while i < list_length+1 #Assign the names to different groups.
		accountability_groups[i] = cohort_list[k..k+(n-1)]
		puts "Group #{i+1}: #{accountability_groups[i]}"
		i += 1
		k += n
	end
end

accountability_group_generator(my_DBC_cohort, 3)

# 4. Refactored Solution

# 1. DRIVER TESTS GO BELOW THIS LINE

# 5. Reflection 


