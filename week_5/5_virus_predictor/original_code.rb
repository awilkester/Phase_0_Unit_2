# U2.W5: Virus Predictor

# I worked on this challenge with Stephen Estrada.

# What is the program doing?

# The program takes each state's population and region information and predicts the number of deaths that 

# HASH -- State Data
# The State Data file is a hash of hashes. IE The bigger hash has hashes inside of it. So in in the inner layer, the data elements are hashes with keys and values. Likewise the bigger state_data hash contains these inner hashes. This is similar to having multiple arrays in a single array.

# Two different types of syntax:
# 1) Strings used as keys
# 2) Symbols used as keys

# EXPLANATION OF require_relative
# Required relative is a rb file that contains all the data for this Virus Predictor. This data is stored in a giant hash that has keys associated with each state in the US. Each key has multiple values associated with population_density, population, the region and the regional spread. 
#
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# This method below takes three parameters and uses them in its inner methods.
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths
    speed_of_spread
  end

  private  
  # Private is a method that hides everything below this line below from public viewing byt he user. 
  # If private is moved about virus_effects then the user is unable to see the outcome of the deaths.

# This method searches through the population density of each state and then discounts the number of people who will die and rounds down.
  def predicted_deaths
    case @population_density
      when 0...50 then number_of_deaths = (@population * 0.05).floor
      when 50...100 then number_of_deaths = (@population * 0.1).floor
      when 100...150 then number_of_deaths = (@population * 0.2).floor
      when 150...200 then number_of_deaths = (@population * 0.3).floor
      else number_of_deaths = (@population * 0.04).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# This method sorts by population density and increments the speed of the virus spread by increments of 0.5.
  def speed_of_spread 
    speed = 0.0

    case @population_density
      when 0...50 then speed += 2.5
      when 50...100 then speed += 2.0
      when 100...150 then speed += 1.5
      when 150...200 then speed += 1.0
      else speed += 0.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

STATE_DATA.each{|k,v| VirusPredictor.new(k, v[:population_density], v[:population], v[:region], v[:regional_spread]).virus_effects}

# OR (both work the same but with different method approaches)

STATE_DATA.map {|k,v| VirusPredictor.new(k, v[:population_density], v[:population], v[:region], v[:regional_spread]).virus_effects}

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects

# REFACTORING:
#     1.) We took out the inputs for virus_effects because they were redundant -- instance variables can be called from anywhere across the function.

#     2.) We simplified both the virus methods in order to remove the inputs and use case statements to simplify the logic.

# Reflection:

=begin 
This challenge was one of the most difficult for the week in my opinion. I found it quite difficult to find the correct methods needed to solve the challenge and also to implement them in such a way as to fulfill all the requirements. I also found the driver code a bit confusing and it wasn't clear upfront what the conditions were. I spent 90% of the time debugging when in reality the code for this challenge was not all that difficult to understand the code up. 

Luckily I had an awesome pairing partner and we worked through everything!
=end

