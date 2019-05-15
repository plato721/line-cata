require './lib/line'

RSpec.describe Line do
  describe "who_is_next" do
    let(:names) {
      ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]
    }

    context "validations" do
      it "position must be at least 1" do
        # IMPLEMENT ME
      end

      it "position must not be greater than 10000000000" do
        # IMPLEMENT ME
      end
    end

    it "first person to vending machine is Sheldon" do
      expect(described_class.who_is_next(names, 1)).to eql("Sheldon")
    end

    it "second person to vending machine is Leonard" do
      expect(described_class.who_is_next(names, 2)).to eql("Leonard")
    end

    it "sixth person is Sheldon" do
      expect(described_class.who_is_next(names, 6)).to eql("Sheldon")
    end

    it "seventh person is Sheldon" do
      expect(described_class.who_is_next(names, 7)).to eql("Sheldon")
    end

    it "eighth person is Leonard" do
      expect(described_class.who_is_next(names, 8)).to eql("Leonard")
    end


    it "52nd is Penny" do
      expect(described_class.who_is_next(names, 52)).to eql("Penny")
    end

    it "7230702951st is Leonard" do
      expect(described_class.who_is_next(names, 7230702951)).to eql("Leonard")
    end
  end
end
