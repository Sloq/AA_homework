class Stack
  def initialize(arr=[])
    # create ivar to store stack here!
    @pile = arr
   end

  def add(el)
    # adds an element to the stack
    @pile.push(el)
  end

  def remove
    # removes one element from the stack
    @pile.pop(el)
  end

  def show
    # return a copy of the stack
    @pile
  end
end

class Queue
  def initialize(arr=[])
    @line = arr
  end

  def enqueue(el)
    @line.push(el)
  end

  def dequeue(el)
    @line.shift(el)
  end

  def show
    @line
  end
end

class Map
  def initialize(arr=[])
    @pairs_map = arr
  end

  def assign(key, value)
    @pairs_map.each_with_index do |pair, idx|
      if pair[0] == key
        @pairs_map[idx][1] = value
        return value
      end
    end
    @pairs_map << [key, value]
  end

  def lookup(key)
    @pairs_map.each {|sub_arr| return sub_arr[1] if sub_arr[0] == key }
    nil
  end

  def remove(key)
    @pairs_map.each_with_index do |sub_arr, idx|
      @pairs_map.delete_at(idx) if sub_arr[0] == key
    end
  end

  def show
    @pairs_map
  end

end
