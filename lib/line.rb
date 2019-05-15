require './lib/queue_segment'

class Line
  class << self
    def who_is_next(list, position)
      queue_segment = build_segments_and_find(list.length,  position)
      position_in_segment = queue_segment.relative_position(position)
      power = queue_segment.power_of_2

      list_index = position_in_segment / 2**power
      list[list_index]
    end

    def build_segments_and_find(length, position)
      current_segment = QueueSegment.new(0, length, 0)
      loop do
        return current_segment if current_segment.contains? position

        current_segment = current_segment.successor
      end
    end
  end
end
