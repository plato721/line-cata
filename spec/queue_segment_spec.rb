require './lib/queue_segment'

RSpec.describe QueueSegment do
  it "has a power_of_2, a segment_total, and an overall_total" do
    power_of_2 = 0
    segment_length = 5
    overall_length = 5

    qs = described_class.new(power_of_2, segment_length, overall_length)

    expect(qs.power_of_2).to be_zero
    expect(qs.segment_length).to eq(5)
    expect(qs.overall_length).to eq(5)
  end

  context "#successor" do
    let(:initial_segment){
      described_class.new(0, 5, 5)
    }

    it "has a successor" do
      result = initial_segment.successor

      expect(result.power_of_2).to eq(1)
      expect(result.segment_length).to eq(10)
      expect(result.overall_length).to eq(15)
    end

    it "has another successor" do
      result = initial_segment.successor.successor

      expect(result.power_of_2).to eq(2)
      expect(result.segment_length).to eq(20)
      expect(result.overall_length).to eq(35)
    end
  end
end
