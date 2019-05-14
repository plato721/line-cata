class QueueSegment
  attr_reader :power_of_2, :segment_length, :overall_length

  def initialize(power_of_2, segment_length, overall_length)
    @power_of_2 = power_of_2
    @segment_length = segment_length
    @overall_length = overall_length
  end

  def successor
    next_segment_length = segment_length * 2
    self.class.new(
      power_of_2 + 1,
      next_segment_length,
      overall_length + next_segment_length
    )
  end
end
