class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    (0...@secret_word.length).select { |i| @secret_word[i] == char }
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    end
        
    @attempted_chars << char
    indices = get_matching_indices(char)
    fill_indices(char, indices)
    @remaining_incorrect_guesses -= 1 if get_matching_indices(char).length == 0
    true
  end

  def ask_user_for_guess
    print 'Enter a char:'
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win?|| lose?
      print @secret_word
      true
    else
      false
    end 
  end
end
