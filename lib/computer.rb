# Class Computer
class Computer < Player
  def random_code
    @guess = default.map { |_item| default.sample }
    @guess.pop
    @guess
  end
end
