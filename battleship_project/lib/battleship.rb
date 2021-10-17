require_relative "board"
require_relative "player"

class Battleship
  
  attr_reader :board, :player
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = (n * n) / 2
  end

  def start_game
    @board.place_random_ships
    puts "num of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    else
      return false
    end
  end

  def win?
    num = @board.num_ships
    if num == 0
      puts "you win"
      return true
    else
      return false 
    end
  end

  def game_over?
    if win? || lose?
      true
    else
      false
    end
  end

  def turn
    pos = @player.get_move
    if !@board.attack(pos)
      @remaining_misses -= 1
    end
    @board.print
    puts @remaining_misses
  end
end
