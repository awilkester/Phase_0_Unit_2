# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Austin Hay
# 2) Jonathan Young

 # This is the file you should end up editing. 

def bakery_num(num_of_people, fav_food) # Defining a method called bakery_num with two parameters (number of people and favorite food)
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} # My list is a hash with 3 keys and 3 values. Keys are the foods and the values are the #'s
  pie_qty = 0 #Initial Quantities
  cake_qty = 0 #Initial Quantities
  cookie_qty = 0 #Initial Quantities
  
  has_fave = false # Seems unnecessary

  my_list.each_key do |k| # Going to take each key in the my_list hash and assign it to an iterator variable k
    if k == fav_food # If the key food is equal to user input for favorite food
      has_fave = true # Condition is true
      fav_food = k # Seems unnecessary, reiterating
    end
  end
  
  if has_fave == false # If user's favorite food input isn't listed (i.e., isn't pie, cake, or cookie)
    raise ArgumentError.new("You can't make that food") # User will receive an error message
  else # If has_fave is true
  fav_food_qty = my_list.values_at(fav_food)[0] # fav_food is going to be user input and can only be
  # pie, cake, or cookie. values_at is going to choose the value to your fav_food input (remember it can
  # only be pie, cake, or cookie). Thus we're going to be setting fav_food_qty to 8, 6, or 1.
  
  if num_of_people % fav_food_qty == 0 # if user input num_of_people divided by fav_food_qty has a remainder equal to 0
    num_of_food = num_of_people / fav_food_qty # new variable num_of_food is equal to user input num_of_people 
    # divided by fav_food_qty
    return "You need to make #{num_of_food} #{fav_food}(s)." # Returns this to the screen
  else num_of_people % fav_food_qty != 0 # SEEMS UNNECESSARY if line 31's condition is not met
    while num_of_people > 0 # while user input num_of_people is greater than 0
        if num_of_people / my_list["pie"] > 0 # If user input num_of_people divided by 8 is greater than 0
          pie_qty = num_of_people / my_list["pie"] # new variable pie_qty is set equal to user input num_of_people
          # divided by 8
          num_of_people = num_of_people % my_list["pie"] #  num_of_people is now equal to the remainder of
          # user input num_of_people divided by 8
        elsif num_of_people / my_list["cake"] > 0 # If user input num_of_people divided by 6 is greater than 0
          cake_qty = num_of_people / my_list["cake"] #new variable pie_qty is set equal to user input num_of_people
          # divided by 6
          num_of_people = num_of_people % my_list["cake"] #num_of_people is now equal to the remainder of
          # user input num_of_people divided by 6
        else
          cookie_qty = num_of_people # new variable cookie_qty = user input num_of_people
          num_of_people = 0
        end
    end
    
    return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
    end
  end
end

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
 
 