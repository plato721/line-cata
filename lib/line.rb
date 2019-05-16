require './lib/queue_segment'

class Line
  class << self
    def who_is_next(list, position)
      queue_segment = build_segments_and_find(list.length,  position)
      index = list_index(position, queue_segment)
      list[index]
    end

    private

    def build_segments_and_find(length, position)
      initial_segment = QueueSegment.new(0, length, 0)
      _build_segments_and_find(initial_segment, position)
    end

    def _build_segments_and_find(current_segment, position)
      if current_segment.contains?(position)
        current_segment
      else
        _build_segments_and_find(current_segment.successor, position)
      end
    end

    def list_index(position, queue_segment)
      position_in_segment = queue_segment.relative_position(position)
      power = queue_segment.power_of_2
      position_in_segment / 2**power
    end
  end
end
