# A dungeon! It's got four rooms, and a bunch of spiders. 
class Dungeon 
  attr_accessor :player
  
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
  
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end
  
  def start(location)
    @player.location = location
    show_current_description 
  end 
  
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end 
  
  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end 
  
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end
  
  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end 
  
  class Player
      attr_accessor :name, :location
      
      def initialize(name)
        @name = name
      end 
    end 
    
  class Room
      attr_accessor :reference, :name, :description, :connections
      
      def initialize(reference, name, description, connections)
        @reference = reference
        @name = name
        @description = description
        @connections = connections
      end
      
      def full_description
        @name = "\n\nYou are in " +@description
      end
    end     
end 

my_dungeon = Dungeon.new("Fred Bloggs")
puts my_dungeon.player.name

my_dungeon.add_room(:antechamber, "The Antechamber", "a deceptively harmless looking room. Quiet winds seem to pull you towards the west.", {:west => :largecave})
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave full of spiders. There is a place of shadow (safety, perhaps?) to the west.", {:west => :smallcave, :east => :antechamber})
my_dungeon.add_room(:smallcave, "Small Cave", "a small and dangerous looking room also probably full of spiders. A wall hanging drops from decaying fibers to reveal a southern exit. And yet, you know that the large cave lays behind you, to the east. Which do you fear more, the known or the unknown?", {:east => :largecave, :south => :otherroom})
my_dungeon.add_room(:otherroom, "Another room", "a room covered in glimmering drawings of creatures you cannot fully comprehend. To the north lay your own footprints, and to the east...", {:north => :smallcave, :east => :secrettunnel})
my_dungeon.add_room(:secrettunnel, "A secret Tunnel", "a hidden door reveales a secret tunnel, but as you touch the handle you realize you have no idea how you got there. Upon stepping away, you forget that the door exists exists. Take a step closer, and the unfathomable knowlege of this tunnel crashes into your vulnerable concious mind. You can only walk east.", {:west => :otherroom, :east => :antechamber})


# Take a quick tour of the dungeon

my_dungeon.start(:antechamber)
my_dungeon.go(:west) # largecave
my_dungeon.go(:west) # small cave
my_dungeon.go(:south) # other room
my_dungeon.go(:east) # secret tunnel


