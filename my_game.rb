require_relative 'round'

class MyGame
  def initialize(interface)
    @interface = interface
  end

  def run
    @interface.enter_name
    @user = Player.new(@name)
    new_round
    loop do
      continue
    end
  end

  private

  def new_round
    if @user.cash.zero?
      puts 'Insufficient funds'
      exit
    else
      Round.new(@user, @interface).run
    end
  end

  def continue
    @interface.message_to_continue
    choice = @interface.choice
    if choice == 'y'
      new_round
    elsif choice == 'n'
      exit
    else
      @interface.selection_error
    end
  end

end
