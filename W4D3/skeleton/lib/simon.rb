class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @difficulty = nil
  end

  def play
    set_difficulty
    while !@game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def set_difficulty
    puts "Choose a difficulty"
    puts "Easy  Medium  Hard   Impossible?"
    puts " 1      2      3         4"
    @difficulty = gets.chomp.to_i
    system("clear")
  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def game_sleep
    case @difficulty
    when 1
      sleep 1
    when 2 
      sleep 0.5
    when 3
      sleep 0.25
    when 4
      sleep 0.05
    end
  end

  def show_sequence
    add_random_color
    i = 1
    @seq.each do |col|
      print "#{i}: #{col}"
      game_sleep
      system("clear")
      game_sleep
      i += 1
    end
  end

  def require_sequence
    puts "Red   Blue   Green   Yellow"
    puts " 1      2      3       4"
    i = 1
    @seq.each do |col|
      print "#{i}: "
      ans = gets.chomp.to_i
      if (ans-1) != COLORS.index(col)
        @game_over = true
        break
      end
      i += 1
    end
    sleep 0.5
  end

  def add_random_color
      @seq << COLORS.sample
  end

  def round_success_message
    p "Successful, current streak #{@sequence_length}"
    sleep 1
  end

  def game_over_message
    p "Game over"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

s = Simon.new
s.play