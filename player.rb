class Player
  attr_reader :name, :hand
  attr_accessor :cash

  def initialize(name)
    @name = name
    @hand = Hand.new
    @cash = 100
  end

  def take_card(deck)
    @hand.cards << deck.cards.shift
  end

  def reset_points
    @hand.sum = 0
  end

  def take_money(cash)
    @cash += cash
  end

  def deduct_money(cash)
    @cash -= cash
  end

end
