class Hand
  attr_reader :dealer, :user, :interface, :bank

  def initialize(dealer, user, interface, bank)
    @dealer = dealer
    @user =user
    @interface = interface
    @bank = bank
  end

  def full_hands?
    @dealer.cards.count == 3 && @user.cards.count == 3
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

  def lose
    @interface.defeat_report
    @bank.get_money(@dealer)
  end

  def win
    @interface.victory_report
    @bank.get_money(@user)
  end

  def draw
    @interface.draw_report
    @bank.split_money(@user, @dealer)
  end

end
