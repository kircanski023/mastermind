require_relative "mastermind"

# Player class
class Player
  include MasterMind

  def initialize
    @default = code
    @guess = Array.new(4)
  end
  attr_reader :default, :guess

  def random_code
    @guess = default.map { |_item| @default.sample }
  end

  def select_code
    temp = ""
    until temp.length == 4
      temp = gets.chomp.downcase.chars
      if temp.length == 4
        @guess = temp
      else
        puts "Wrong input"
      end
    end
  end
end
