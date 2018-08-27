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

  def points
    @sum = 1
    @aces = []
    @pictures = %i[K Q J]
    @cards.each do |card|
      if card.face == :A
        @aces << card
        @sum += 11
      elsif @pictures.include?(card.face)
        @sum += 10
      else
        @sum += card.face.to_i
      end
    end
    check_aces
  end

  def check_aces
    @aces.each { @sum -= 10 if @sum > 21 }
  end

  def take_money(cash)
    @cash += cash
  end

  def deduct_money(cash)
    @cash -= cash
  end

end
