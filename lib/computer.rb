# Class Computer
class Computer < Player
  def initialize
    super
    @radnom = Array.new(4)
  end
  attr_accessor :random

  def random_code
    self.random = default.shuffle
    random.pop
    random
  end
end
