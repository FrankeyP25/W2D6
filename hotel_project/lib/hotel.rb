require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each { |room, capacity| @rooms[room] = Room.new(capacity) }
  end

  def name
    @name.split(" ").map { |el| el.capitalize }.join(" ")
  end

  attr_reader :rooms

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(person, room)
    if !room_exists?(room)
      puts 'sorry, room does not exist'
    else
      if @rooms[room].add_occupant(person)
        puts 'check in successful'
      else
        puts 'sorry, room is full'
      end
    end
  end

  def has_vacancy?
    count = 0
    @rooms.each { |r, c| count += 1 if c.available_space > 0 }
    count > 0
  end
  
  def list_rooms
    @rooms.each do |room, capacity|
      puts "#{room} #{capacity.available_space}"
    end
  end
end
