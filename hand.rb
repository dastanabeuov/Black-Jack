class Hand

  def full_hands?(dealer, user)
    dealer.cards.count == 3 && user.cards.count == 3
  end

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

  def dealer_cards_message(dealer)
    puts 'Dealer cards:'
    dealer.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

  def user_cards_message(user)
    puts 'Your cards:'
    user.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

end
