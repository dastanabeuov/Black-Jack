class Player
  attr_reader :name, :cards, :hand
  attr_accessor :cash, :sum

  def initialize(name, hand)
    @name = name
    @hand = hand
    @cash = 100
    @cards = []
    @sum = 0
  end

  def take_card(deck)
    @cards << deck.cards.shift
  end

  def reset_points
    @sum = 0
  end

  def take_money(cash)
    @cash += cash
  end

  def deduct_money(cash)
    @cash -= cash
  end

end
