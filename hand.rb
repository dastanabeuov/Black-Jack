class Hand
  attr_reader :dealer, :user

  def initialize(dealer, user)
    @dealer = dealer
    @user =user
  end

  def full_hands?
    @dealer.cards.count == 3 && @user.cards.count == 3
  end

  def points(player)
    player.sum = 1
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

  def dealer_points_message(player)
    puts "Dealer points: #{player.sum}"
  end

  def dealer_cards_message(player)
    puts 'Dealer cards:'
    player.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

  def user_points_message(player)
    puts "Your points: #{player.sum}"
  end

  def user_cards_message(player)
    puts 'Your cards:'
    player.cards.each do |card|
      puts "#{card.face}#{card.suit}"
    end
  end

end
