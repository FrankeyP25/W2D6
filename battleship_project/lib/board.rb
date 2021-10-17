require "byebug"

class Board

  attr_reader :size
  def initialize(num)
    @grid = Array.new(num) {Array.new(num, :N)}
    @size = num * num
  end

  def [](pos)
    r, c = pos
    @grid[r][c]
  end

  def []=(pos, val)
    r, c = pos
    @grid[r][c] = val
  end
  
  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  #part 2 =============================================

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    num = (@size * 25) / 100
    while num_ships < num 
      size = @grid.length
      r = rand(0...size)
      c = rand(0...size)
      @grid[r][c] = :S
    end
  end

  def hidden_ships_grid
    @grid.map { |row| row.map { |el| el == :S ? :N : el } }
  end

  def self.print_grid(arr)
    arr.each { |sub| puts sub.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
