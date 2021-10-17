class Board

require "byebug"


  
    def self.build_stacks(num)
        Array.new(num) {Array.new([])}
    end

    def initialize(n, max)
        raise "rows and cols must be >= 4" if n < 4 || max < 4
        @max_height = max
        @stacks = Board.build_stacks(n)
    end
    attr_reader :max_height

    def [](pos)
        @stacks[pos]
    end

    def add(token, stack_i)
        if @stacks[stack_i].length < @max_height
            @stacks[stack_i] << token
            return true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.any? { |row| (0...@max_height).all? { |col| row[col] == token} }
    end

    def horizontal_winner?(token)
        (0...@max_height).any? { |col| @stacks.all? { |row| row[col] == token } }
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end






    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
