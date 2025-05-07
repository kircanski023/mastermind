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
    until temp.length == 4 && !wrong_input?
      temp = gets.chomp.downcase.chars
      @guess = temp
      puts "Make sure you type A, B, C or D!" if wrong_input?
      puts "Must type 4 characters" unless temp.length == 4
    end
  end

  private

  def wrong_input?
    !@guess.difference(code).empty?
  end
end
