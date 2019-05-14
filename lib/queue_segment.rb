class QueueSegment
  attr_reader :power_of_2, :segment_length, :offset

  def initialize(power_of_2, segment_length, offset)
    @power_of_2 = power_of_2
    @segment_length = segment_length
    @offset = offset
  end

  def successor
    self.class.new(
      power_of_2 + 1,
      segment_length * 2,
      offset + segment_length
    )
  end

  def contains? position
    position > offset && position - offset <= segment_length
  end

  def relative_position position
    raise ArgumentError if !contains? position

    position - offset - 1
  end
end
