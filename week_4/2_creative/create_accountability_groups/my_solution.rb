# U2.W4: Create Accountability Groups

# I worked on this challenge with Stephen Estrada.

# 2. Pseudocode

# Input: Array that includes the names of all the students in my cohort to separate into accountability groups.
# Output: Should include 6 sets of four students each that are randomized into accountability groups. 
# Steps: Randomize the cohort, assign each student to a group, reassign students to a new group that does not include people they were with before

# 3. Initial Solution

my_DBC_cohort = [ "Rootul Patel", "Hilary Barr" , "Alan Florendo" , "Cassie Moy" , "Stephen Craig Estrada", "Austin Hay", "Anthony Edwards Jr." , "John Berry" , "Farheen Malik" , "Daniel Deepak" , "RJ Arena", "Justin Lee" , "Michael Weiss", "David Sin" , "Julius Jung" , "Fahia Mohamed", "Molly Huerster" ,"Eric Hou" , "Avi Fox-Rosen" ,"Joel Yawili" , "Dylan Richards" ,"Kaitlyn La" ,"Derek Siker" , "Dylan Krause"]

def accountability_group_generator(cohort_list, n)
	accountability_groups = Array.new
	list_length = cohort_list.size/n
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

puts accountability_group_generator(my_DBC_cohort, 4)


# 4. Refactored Solution

my_DBC_cohort = [ "Rootul Patel", "Hilary Barr" , "Alan Florendo" , 
	"Cassie Moy" , "Stephen Craig Estrada", "Austin Hay", "Anthony Edwards Jr." , 
	"John Berry" , "Farheen Malik" , "Daniel Deepak" , "RJ Arena", "Justin Lee" , 
	"Michael Weiss", "David Sin" , "Julius Jung" , "Fahia Mohamed", "Molly Huerster" ,
	"Eric Hou" , "Avi Fox-Rosen" ,"Joel Yawili" , "Dylan Richards" ,"Kaitlyn La" ,
	"Derek Siker" , "Dylan Krause"]

def accountability_group_generator (cohort_list, n)
  accountability_groups = []
  list_size = cohort_list.size / n
  cohort_list = cohort_list.sort_by {rand}
  i = 0
  k = 0

  while i <= list_size
  	accountability_groups[i] = cohort_list[k..k+(n-1)]
	puts "Group #{i+1}: #{accountability_groups[i]}"
	i += 1
	k += n

  	if cohort_list[k-1] == cohort_list[-1]
  		return
	end
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE

# We can test our code's results using these predicted outputs below

describe 'group_creator' do 
  let(:cohort) {["Rootul Patel", "Hilary Barr" , "Alan Florendo" , "Cassie Moy" , "Stephen Craig Estrada",
                  "Austin Hay", "Anthony Edwards Jr." , "John Berry" , "Farheen Malik" , "Daniel Deepak" ,
                  "RJ Arena", "Justin Lee" , "Michael Weiss", "David Sin" , "Julius Jung" , "Fahia Mohamed",
                  "Molly Huerster" ,"Eric Hou" , "Avi Fox-Rosen" ,"Joel Yawili" , "Dylan Richards" ,"Kaitlyn La" ,
                  "Derek Siker" , "Dylan Krause"]}
  
  it "is defined" do
    defined?(accountability_group_generator).should eq 'method'
  end

  it "has two arguments" do 
    method(:accountability_group_generator).should eq 2
  end

accountability_group_generator(my_DBC_cohort, 2) #We should have 2 cohort members per array output. 
accountability_group_generator(my_DBC_cohort, 4) #We should have 4 cohort members per array output. 
accountability_group_generator(my_DBC_cohort, 5) #We should have 5 cohort members per array output. 
accountability_group_generator(my_DBC_cohort, 7) #We should have 7 cohort members per array output. 

# 5. Reflection 

=begin
For this challenge, I found the exercise very exciting. I enjoyed thinking about possible ways to 
build in driver code and also sufficiently randomize the process. If given more time I would have liked to 
develop a more robust framework that would have used boolean logic to ensure that members were never in the 
same group twice (or approach that limit). Instead I decided to use a {rand} along with sort_by in order to 
get the randomization needed so that each group was different. This means that among differnt trials there 
will probably be members in each group repeated out of chance. Overall, however, I think this is a pretty 
robust accountability group generator and I'm really proud of it! :)
=end
