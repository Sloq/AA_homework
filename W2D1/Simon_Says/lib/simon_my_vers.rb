class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = @seq.count
    @game_over = false
    @user_guess = []
  end

  def play
    until @game_over
      add_random_color
      show_sequence
      round_length = 1
      while @user_guess.count < round_length && !@game_over
        take_turn
        require_sequence
      end
      round_success_message
    end
    game_over_message
    reset_game
  end

  def take_turn
    puts "Repeat the colors that were shown to you one by one"
    users_turn_guess = gets.chomp
    @user_guess << users_turn_guess
  end

  def show_sequence
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    user_guess_count = @user_guess.length
    sub_sequence = @seq[0...user_guess_count]
    @game_over = true unless sub_sequence == @user_guess
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good work, lets take it one further"
  end

  def game_over_message
    puts "Try harder next time ;)"
    puts "Would you like to play again?"
    puts "y/n"
    replay = gets.chomp
    replay
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = @seq.count
  end
end

game = Simon.new
game.play
