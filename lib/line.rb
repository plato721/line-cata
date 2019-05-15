class Line
  def self.who_is_next(list, position)
    marker = 0
    while position != marker
      head_of_line = list.shift
      marker += 1
      if marker == position
        return head_of_line
      else
        puts "#{marker} positions checked..."
        list.concat([head_of_line, head_of_line])
      end
    end
  end
end
