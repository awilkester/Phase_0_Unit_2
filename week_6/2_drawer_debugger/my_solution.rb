# U2.W6: Drawer Debugger

# I worked on this challenge by myself.

# 2. Original Code

class Drawer

attr_reader :contents

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@open ? (@contents << item) : (puts "Open drawer before putting silverware in.")
	end

	def remove_item(item = @contents.pop) # .pop removes the last element in an array and returns it
		@open ? (@contents.delete(item)) : (puts "Open drawer before taking silverware out.")
	end

	def dump  # what should this method return? The phrase your drawer is empty and it should empty the @contents
		if @open
			puts "Your drawer is empty."
			@contents = []
		else
			puts "Open the drawer to empty it, first!"
		end
	end

	def view_contents
		if @contents.empty?
			puts "No silverware in here."
		else
			puts "The drawer contains:"
			@contents.each {|x| puts "- " + x.type }
		end
	end
end

class Silverware
	attr_reader :type

	def initialize(type, clean = true)
		@type = type.to_s
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		puts "cleaned the #{type}"
		@clean = true
	end

	def clean
		@clean = true
	end

	def dirty
		@clean = false
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 

puts silverware_drawer.to_s

silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

silverware_drawer.add_item(Silverware.new("fork"))
fork = silverware_drawer.remove_item("fork") #add some puts statements to help you trace through the code...
fork.eat

#BONUS SECTION

puts fork.clean

# DRIVER TESTS GO BELOW THIS LINE
drawer_test = Drawer.new
knife_test = Silverware.new("knife")
fork_test  = Silverware.new("fork")

p drawer_test.view_contents 
drawer_test.add_item(knife1) 
drawer_test.add_item(fork1) 
drawer_test.close 
drawer_test.open 
drawer_test.view_contents 
drawer_test.close 
drawer_test.remove_item(fork1) 

fork_test.eat 
fork_test.clean 

drawer_test.close 
drawer_test.dump 
drawer_test.open 

# 5. Reflection

# In general I found this exercise a bit tedious.

# I learned how to debug code and how to write new methods into existing bugged code.

# I felt very comfortable with all the learning lessons!

# I learned how to use attr_reader! and, perhaps more important, attr_ancestor... which is a cool read and write option on ruby 