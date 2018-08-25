class Hand
  attr_reader :cards

  def points
    @sum = 0
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

  def take_card(deck)
    @cards << deck.cards.shift
  end

  def check_aces
    @aces.each { @sum -= 10 if @sum > 21 }
  end

end
