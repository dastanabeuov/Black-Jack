require_relative 'hand.rb'

class Player < Hand
  attr_reader :cards, :name, :sum
  attr_accessor :cash

  def initialize(name)
    @name = name
    @cash = 100
    @sum = 0
    super()
  end

  def take_money(sum)
    @cash += sum
  end

  def deduct_money(sum)
    @cash -= sum
  end

  def reset_points
    @sum = 0
  end
end
