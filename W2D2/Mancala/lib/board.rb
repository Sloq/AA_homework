class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |cup|
      if cup == 6 || cup == 13
        @cups << []
      else
        @cups << [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 5) || start_pos.between?(7,12)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    our_stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_to_drop_stone_in = (start_pos + 1) % 14
    until our_stones.empty?
      if current_player_name == name1
        cup_to_drop_stone_in += 1 if cup_to_drop_stone_in == 13
        cup_to_drop_stone_in %= 14
      end
      if current_player_name == name2
        cup_to_drop_stone_in += 1 if cup_to_drop_stone_in == 6
        cup_to_drop_stone_in %= 14
      end
      @cups[cup_to_drop_stone_in] << our_stones.pop
      cup_to_drop_stone_in += 1
      cup_to_drop_stone_in %= 14
    end
    render
    next_turn(cup_to_drop_stone_in-1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 5 || ending_cup_idx == -1
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    elsif @cups[ending_cup_idx].count > 1
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
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    return :draw if @cups[6].count == @cups[13].count
    return @name1 if @cups[6].count > @cups[13].count
    @name2
  end
end
