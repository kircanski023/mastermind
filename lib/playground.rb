# Playground class
class Playground
  include MasterMind
  def initialize
    @player = Player.new
    @computer = Player.new
    @code = @computer.random_code
    puts "Welcome to Mastermind! \n Guess the CODE by typing 4 characters (a, b ,c)"
  end
  attr_reader :code

  def player_selection
    @player.guess
  end

  def player_win?
    player_selection == code
  end

  def in_place?
    code.each_with_index
  end

  def play_game
    i = 0
    while i < 12
      @player.select_code
      i += 1
      puts "Choices left #{12 - i}" unless (12 - i).zero?
      puts "Game Over Computer Wins!\n Computer code: #{code.join}" if (12 - i).zero?
      break if player_win?
    end
  end
end
