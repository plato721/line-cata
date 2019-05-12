require './lib/line'

RSpec.describe Line do
  describe "who_is_next" do
    let(:names) {
      ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]
    }

    it "first person to vending machine is Sheldon" do
      expect(described_class.who_is_next(names, 1)).to eql("Sheldon")
    end
  end
end
