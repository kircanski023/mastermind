# Playground class
class Playground
  def initialize
    @player = Player.new
    @computer = Computer.new
    @choice = 0
    @code = []
    @position = []
    puts "Welcome to Mastermind! \n Guess the CODE by typing (a, b ,c, d, e)"
  end
  attr_accessor :position, :player, :code, :choice

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

  def start_game
    puts "Make a choice: \n1. Code Maker 2. Code Breaker"
    self.choice = gets.chomp.to_i
    if choice == 1
      puts "YOU are The Code Maker Select your code using (a, b, c, d, e)"
      self.code = player.select_code
    elsif choice == 2
      puts "OK, The code is ready! You can guess now!"
      self.code = @computer.random_code
    end
  end

  def selection
    puts "It's your turn"
    if choice == 1
      p @computer.random_code
    elsif choice == 2
      player.select_code
    end
    includes
    in_position
  end

  def play_game
    start_game
    i = 0
    while i < 12
      selection
      i += 1
      puts "Choices left #{12 - i}" unless (12 - i).zero?
      puts "Game Over!\n Secret Code: #{code.join}" if (12 - i).zero?
      break if player_win?
    end
  end

  def player_selection
    if choice == 2
      @player.guess
    elsif choice == 1
      @computer.random
    end
  end
end
