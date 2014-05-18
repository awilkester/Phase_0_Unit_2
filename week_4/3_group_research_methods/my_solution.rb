# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
	source.grep(/#{thing_to_find}/)
end

def my_hash_finding_method(source, thing_to_find)
	age_match = []
  	source.each do |key, value|
  		age_match << key if value == thing_to_find
  	end
  	age_match
end

# Identify and describe the ruby method you implemented. 

=begin
# my_array_finding_method

	For the first method I used the .grep method:
	http://www.ruby-doc.org/core-2.1.1/Enumerable.html#method-i-grep

# my_hash_finding_method

	For the second method I used the .each method do loop through, 
	find the values that are equal to thing_to_find, and push the 
	corresponding key into the empty array created outside the loop. 
	I then display this array at the end.
=end

# Person 2
def my_array_modification_method(source, thing_to_modify)
	source.map! do |x|
  		if x.is_a?(Integer) 
  			x + thing_to_modify
  		else
  			x
  		end
  	end
end

def my_hash_modification_method(source, thing_to_modify)
	source.each do |name, age|
		source[name] += thing_to_modify
	end
end

# Identify and describe the ruby method you implemented. 

=begin
# my_array_modification_method
 	
 	I used the .map! method along with .is_a? logic in order to 
 	find the integers in the data structure. Then I added the value to it.

 	http://www.ruby-doc.org/core-2.1.1/Array.html


# my_hash_modification_method

	I used a simple .each method to loop through, find the 
	index where source was equal to the name and change the age.
=end

# Person 3
def my_array_sorting_method(source)

   source.map { |value| value.to_s }.sort_by{|value| value}

 end

def my_hash_sorting_method(source)
   source.sort_by{ |key,value| [value , key]}

end

# Identify and describe the ruby method you implemented. 
# I chose to use the sort_by method to complete this release. Sort_by is good if the values
# you're sorting on require some kind of complex calculation or operation to get their value. 
# using the sort() method would require a greater number of comparision operations to determine 
# where the item goes in a ordered list.  Sort_by only calls this comparision operatoion once to 
# make the same ordered list.  Sort_by is considered more efficient for larger sets of data. 

# Person 4
def my_array_deletion_method(source, thing_to_delete)
 p source.delete_if {|thing_to_modify| thing_to_modify.to_s.include? (thing_to_delete)}
end

def my_hash_deletion_method(source, thing_to_delete)
  p source.delete_if {|thing_to_modify| thing_to_modify.to_s.include? (thing_to_delete)}
end

# Identify and describe the ruby method you implemented. 
#I chose to use the delete_if method.  it takes the item you identify in the code block, deletes it from your 
# data structure, and returns the new values.  I had also thought about using reject, but that 
# method does not change the array and will return nil.
#


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!

=begin
Overall I thought this challenge was quite difficult (especially the first part). 
Once I understood how to use .map! it was not a big deal at all, but it was very 
frustrating trying to figure out how to map it before then. I also had a few syntax 
errors along the way that caused me trouble. In the future I will be more cognizant 
of these issues. Overall I enjoyed the exercises and learned a LOT!
=end

