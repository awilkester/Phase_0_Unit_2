# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: Jonathan Young


# Our Refactored Solution
# *What this code does:
# Input: Number of people to be served + the favorite food item. There are three favorite food options that can be input: pie, cake and cookies. Each favorite food item must be input as a string. Ex: "cookies"
# Construct: The method takes the number of people and your favorite food inputted and tries to make as many as possible using a key that has the number of people each food serves. 

# Our Refactored Solution #1
=begin

def bakery_num(num_of_people, fav_food) # Defining a method called bakery_num with two parameters (number of people and favorite food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} # My list is a hash with 3 keys and 3 values. Keys are the foods and the values are the #'s
  pie_qty = 0 #Initial Quantities
  cake_qty = 0 #Initial Quantities
  cookie_qty = 0 #Initial Quantities
  fav_food_qty = my_list.values_at(fav_food)[0]

  if num_of_people < 0
    return false
  end

  my_list.each_key do |k| # Going to take each key in the my_list hash and assign it to an iterator variable k
    if fav_food != k  # If the key food is equal to user input for favorite food
      raise ArgumentError.new("You can't make that food") # User will receive an error message
    end
  end
  
  if num_of_people % fav_food_qty == 0 # if user input num_of_people divided by fav_food_qty has a remainder equal to 0
    num_of_food = num_of_people / fav_food_qty # new variable num_of_food is equal to user input num_of_people 
    # divided by fav_food_qty
  	return "You need to make #{num_of_food} #{fav_food}(s)." # Returns this to the screen
  end
    
  if num_of_people / my_list["pie"] >= 1  
     pie_qty = num_of_people / my_list["pie"] 
     num_of_people = num_of_people % my_list["pie"]  #  num_of_people is now equal to the remainder of
          # user input num_of_people divided by 8
  elsif num_of_people / my_list["cake"]  >= 1 # If user input num_of_people divided by 6 is greater than 0
        cake_qty = num_of_people / my_list["cake"]  #new variable pie_qty is set equal to user input num_of_people
          # divided by 6
        num_of_people = num_of_people % my_list["cake"]  #num_of_people is now equal to the remainder of
          # user input num_of_people divided by 6
  else
        cookie_qty = num_of_people # new variable cookie_qty = user input num_of_people
        num_of_people = 0
  end
    
  return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)." 
    
end
=end

# A Better, working Refactored Solution After Better Planning and proper Execution :) Done by myself. :(

def bakery_num(num_of_people, fav_food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  quantity = {"pie" => 0, "cake" => 0, "cookie" => 0}
  raise ArgumentError.new("You can't make that food") unless my_list.include?(fav_food)

  quantity[fav_food] = num_of_people / my_list[fav_food]
  remainder = num_of_people % my_list[fav_food]
    return "You need to make #{quantity[fav_food]} #{fav_food}(s)." if num_of_people % my_list[fav_food] == 0

  my_list.each do |key,value|
    next if remainder < value
    quantity[key] = (remainder / value)
    remainder = remainder % value
  end 

    "You need to make #{quantity["pie"]} pie(s), #{quantity["cake"]} cake(s), and #{quantity["cookie"]} cookie(s)."
end

#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# Altered Driver code
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." 

#  Reflection 

=begin
While we did not completely finish this challenge, this GPS was an amazing learning experience in working on pairs. From the start I now realize that we should have spent less time trying to make MY solution work and more time mapping out a possible solution that would work -- refactoring is always there for a reason! I feel a bit bad now that I spent so much time driving and that I was so bossy. In the future I hope to implement a better structure upfront and to be open to changes in our operation path. As it can be seen from our code above, we kinda went all over the place and after a few hours of trying to get it to work I think we were just exhausted and ready to quit"
=end

