class Hand

  def points(player)
    player.sum = 0
    @aces = []
    @pictures = %i[K Q J]
    player.cards.each do |card|
      if card.face == :A
        @aces << card
        player.sum += 11
      elsif @pictures.include?(card.face)
        player.sum += 10
      else
        player.sum += card.face.to_i
      end
    end
    check_aces
  end

  def check_aces
    @aces.each { @sum -= 10 if @sum > 21 }
  end

end
