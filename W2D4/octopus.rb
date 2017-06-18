def sluggish_ocotopus(fish)
  fish.each do |our_fish|
    return our_fish if fish.all {|other_fish| our_fish > other_fish}
  end
end

def dominant_octo(fish)
  pivot = fish[0]
  bigger_fish = fish[1..-1].select {|le_fish| pivot <= le_fish }
  pivot + dominant_octo(bigger_fish)
end

def clever_octo(fish)
  biggest_fish = ""
  fish.each {|current_fish| biggest_fish = current_fish if current_fish > biggest_fish}
  biggest_fish
end

def dancing_octo(dance_move_arr)
  dance_move_arr.each_index {|idx| puts idx}
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

  def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
  end
