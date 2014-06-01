# U2.W6: Refactoring for Code Readability

# I worked on this challenge by myself.
# I refactored Stephen Estrada's SOLO challenge solution (Challenge #4 from Week 6)

# Original Solution
class Song 
	attr_reader :title, :artist

  def initialize title, artist
  	@title = title
  	@artist = artist
  end

  def play 
  	p "You're now listening to #{pretty_name}"
  end

  def pretty_name
  	"#{@title} by #{@artist}"
  end
end

class Playlist

  def initialize 
  	@library = []
  end 

  def add *tracks
  	@library << tracks
  end

  def num_of_tracks
    @library.size
  end

  def remove(tracks = @library.pop)
  	@library.delete(tracks)
  end

  def display 
  	p "The library contains:"
  	@library.each {|song| p "- " + song.pretty_name }
  end

  def play_all
  	p "Library will play all: #{@library}"
  end

  def includes?
  	@library.include?
  end
end

# Refactored Solution

# Unfortunately this week's solo challenge was quite simple and I found it extremely difficult to change any of my team-mate's code for refactoring. There are other methods that could be used as substitutes, but they are actually longer than Stephen's selected methods.

# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
 
lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.includes?(lying_from_you) == true
my_playlist.play_all
my_playlist.display

# Reflection 

=begin 

To be completely honest, I felt that this exercise was not very constructive. Most of the exercises this week were simple to streamline and required few complex methods. It was extremely difficult to refactor various challenges, so I  ended up just picking this one from Stephen even though there was no refactoring I could do.

=end