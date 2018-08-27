class Round

  def initialize(user, interface)
    @user = user
    @interface = interface
    @dealer = Dealer.new
    @deck_for_game = Deсk.new
    @bank = Bank.new
    @hand = Hand.new(@dealer, @user, @interface, @bank)
  end

  def run
    @user.reset_points
    @user.cards.clear
    @deck_for_game.create_deck
    @deck_for_game.cards.shuffle!
    cards_for_players
    @bank.take_bet(@dealer)
    @bank.take_bet(@user)
    cards
    dealing
  end

  private

  def cards
    user_cards
    @interface.unknown_dealer_cards
  end

  def dealing
    if @hand.full_hands?
      open_cards
    else
      @interface.user_chioce
      @choice = @interface.choice
      case @choice.to_i
      when 1
        dealer_turn
      when 2
        @user.take_card(@deck_for_game)
        raise 'You can add only one card' if @user.cards.count > 3
        dealer_turn
      when 3
        open_cards
      else
        puts 'Choice is wrong. Try again'
        exit
      end
    end
  end

  def dealer_turn
    @dealer.take_card(@deck_for_game) if can_add_card?
    dealing
  end

  def user_cards
    @interface.user_cards_message(@user)
    @user.points
    @interface.user_points_message(@user)
  end

  def dealer_cards
    @interface.dealer_cards_message(@dealer)
    @dealer.points
    @interface.dealer_points_message(@dealer)
  end

  def cards_for_players
    2.times do
      @user.take_card(@deck_for_game)
      @dealer.take_card(@deck_for_game)
    end
  end

  def can_add_card?
    @dealer.sum < 17 && @dealer.cards.count != 3
  end

  def open_cards
    user_cards
    dealer_cards
    @hand.verify
  end

end
