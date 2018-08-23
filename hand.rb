class Hand

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

  def verify
    if @user.sum > 21 || @user.sum < @dealer.sum && @dealer.sum <= 21
      lose
    elsif @user.sum > @dealer.sum || @dealer.sum > 21
      win
    else
      draw
    end
  end

  def full_hands?
    @dealer.cards.count == 3 && @user.cards.count == 3
  end

end
