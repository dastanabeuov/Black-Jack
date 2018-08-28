class Player
  attr_reader :name, :cards
  attr_accessor :cash, :sum

  def initialize(name)
    @name = name
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
