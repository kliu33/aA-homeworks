class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    fill_cups
  end

  def fill_cups
    (0...6).each do |idx|
      4.times {@cups[idx] << :stone}
    end
    (7...13).each do |idx|
      4.times {@cups[idx] << :stone}
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos].length
    @cups[start_pos] = []
    idx = start_pos
    while stones != 0 
      idx = (idx + 1) % 14 
      next if current_player_name == @name1 && idx == 13
      next if current_player_name == @name2 && idx == 6
      @cups[idx] << :stone
      stones -= 1
    end
    render
    return next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx 
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0...6].all? {|cup| cup.empty?} || @cups[6...13].all? {|cup| cup.empty?}
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @name1 if @cups[6].length > @cups[13].length
    return @name2 if @cups[6].length < @cups[13].length
  end
end
