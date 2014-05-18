# U2.W4: Cipher Challenge

# I worked on this challenge with: Stephen Estrada.

# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

# Creates a method "north_korean_cipher" that takes an input that is a coded message.
def north_korean_cipher(coded_message)
# Takes the input coded message and lower cases it. Then splits each character up, including spaces, and stores in an element of a new array.
  input = coded_message.downcase.split("")
  # Creates an empty array to be used later in the method.
  decoded_sentence = []
  cipher = {"e" => "a",   # A Hash might not be the best way to do this. We are considering shifting the letters by 4 instead in a streamlined and automated fashion. We can use the .range and .shift methods.
            "f" => "b",   
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
  #Takes the input variable, which is just an array with all the characters, and iterates over it using the temporary variable x, which signifies the index location.             
  input.each do |x| 
    found_match = false  
    # Takes the cipher hash and goes over every key (listed as the temporary variable y)
    cipher.each_key do |y| 
      # Verifies if the character x in the array is equal to the key in the hash cipher.
      if x == y  
        #Prints a statement stating that our 'x' variable equals our 'y' variable.
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        #Get value from cipher hash and place into our decoded sentence array
        decoded_sentence << cipher[y]
        # Set found match variable to true
        found_match = true
        break  # This breaks because it has found a match and no longer needs to check for any other conditions. Will move on to the next x variable in the loop. 
      #Checks to see if the x variable is a special character.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
        #This pushes a space into the decoded sentence array
        decoded_sentence << " "
        # Now that we have found a match this action makes the variable set to true
        found_match = true
        # Since a match is found we can move on to next iteration in loop.
        break
      # Takes 0 through 9 inclusive and stores in array, then checks to see if x is included in the array (ie is it equal to any element in the array)
      elsif (0..9).to_a.include?(x)
        #This pushes the letter into the decoded sentence array.
        decoded_sentence << x
        #Match has been found, so this action makes it true. 
        found_match = true
        break
      # Closes the boolean logic (if and else-if statements)  
      end 
    # Close the cipher.each_key
    end
    # This states that if our variable 'found_match' is still false then we juust add temporary variable 'x' onto our other variable 'decoded_sentence'
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  #Closes the input.each loop.
  end
  # Takes all elements in 'decoded_sentence' and joins them together as a single string.
  decoded_sentence = decoded_sentence.join("")
 
 # Boolean logic set if any input value contains digits
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
    #Takes the digits and converts them by dividing by 100
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
  end  
  # Returns the same "decoded_sentence" string with the modified number.
  return decoded_sentence # What is this returning?        
#End of entire method! :D
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  alphabet_characters = ("a".."z").to_a
  extra_characters = ["@", "#", "$", "%", "^", "&", "*"]
  array_message = coded_message.downcase.split("")
  final_array = []
  array_message.each do |letter|
    if alphabet_characters.include?(letter)
      alphabet_characters_position = alphabet_characters.index(letter)
      final_array << alphabet_characters[alphabet_characters_position - 4]
    elsif (0..9).to_a.include?(letter)
      final_array << letter
    elsif extra_characters.include?(letter)
      final_array << (" ")
    else
      final_array << letter
    end
  end
  final_array = final_array.join("")

  if final_array.match(/\d+/) 
    final_array.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
    return final_array     
end

p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")

# Driver Code:

p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# Reflection

=begin
Overall I really enjoyed this portion of the week! This code assignment was really 
hard, but I loved it! I found the most challenging part was just taking the time to 
go through the code and understand how it all worked. Once we figured most of that 
out it was just putting in the time to figure out the refacotring and looking up the 
necessary components along the way. Overall, this was an incredible learning experience 
with a great DBC'er who I was happy to work with! :) 
=end

