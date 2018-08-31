class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def points(player)
    player.sum = 0
    @aces = []
    @pictures = %i[K Q J]
    player.hand.cards.each do |card|
      if card.face == :A
        @aces << card
        player.sum += 11
      elsif @pictures.include?(card.face)
        player.sum += 10
      else
        player.sum += card.face.to_i
      end
    end
    check_aces(player)
  end

  def check_aces(player)
    @aces.each { player.sum -= 10 if player.sum > 21 }
  end

end
