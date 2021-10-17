class Room
  def initialize(num)
    @occupants = []
    @capacity = num
  end
  attr_reader :capacity
  def occupants
    @occupants
  end

  def full?
    @occupants.length < @capacity ? false : true
  end

  def available_space
    @capacity - @occupants.length
  end
  
  def add_occupant(person)
      if full?
        return false
      else
        @occupants << person
        return true
      end
  end
end


