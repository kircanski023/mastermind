# Playground class
class Playground
  include MasterMind
  def initialize
    @player = Player.new
    @computer = Player.new
    @code = @computer.random_code
    @position = []
    puts "Welcome to Mastermind! \n Guess the CODE by typing 4 characters (a, b ,c, d)"
  end
  attr_accessor :position, :player, :code

  def player_win?
    puts "You WON!" if player_selection == code
    player_selection == code
  end

  def in_position
    self.position = []
    player_selection.each_index do |index|
      position.push("*") if player_selection[index] == code[index]
    end
    puts "[#{position.join('][')}] <- In place"
  end

  def includes # rubocop:disable Metrics/AbcSize
    self.position = []
    player_selection.intersection(code).each do |item|
      position << ("o" * [code.count(item), player_selection.count(item)].min) # Correct number of included elements
    end
    puts "[#{position.join.chars.join('][')}] <- Present"
  end

  def play_game
    i = 0
    while i < 12
      @player.select_code
      includes
      in_position
      i += 1
      puts "Choices left #{12 - i}" unless (12 - i).zero?
      puts "Game Over Computer Wins!\n Computer code: #{code.join}" if (12 - i).zero?
      break if player_win?
    end
  end

  def player_selection
    @player.guess
  end
end
