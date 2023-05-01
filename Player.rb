class Player

  attr_accessor :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose
    self.lives -= 1
  end

end