class Line
	attr_reader :list
  attr_accessor :power_current_total_map

  def self.who_is_next(list, position)
    new(list).who_is_next(position)
  end

  def initialize(list)
  	@list = list
  	@power_current_total_map = [
  		[0, list.length, list.length],
  	    [1, list.length * 2, list.length * 3 ]
  	]
  end

  def who_is_next(position)
  	return list[position - 1] if position < list.length

    i = power_current_total_map_index(position)
    position_in_row = position - power_current_total_map[i - 1][2] - 1
    list_index = position_in_row / 2**power_current_total_map[i][0]
    list[list_index]
  end

  def power_current_total_map_index(position)
    i = 0
    loop do
      return i if power_current_total_map[i][2] >= position
      
      i += 1
      create_row(i) if !power_current_total_map[i]
    end
  end

  def create_row(i)
    power = power_current_total_map[i - 1][0] + 1
    current_total = 2**power * 5
    total = current_total + power_current_total_map[i - 1][2]
    power_current_total_map << [power, current_total, total]
  end
end
