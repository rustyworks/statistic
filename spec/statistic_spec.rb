require "rspec/autorun"
require_relative "../lib/statistic"

describe Statistic do
  let(:statistic) { Statistic.new([5, 3, 1, 7, 11]) }

  describe "#initialize" do
    it "initialize the data" do
      expect(statistic.list).not_to be_nil
      expect(statistic.list).to eq [1, 3, 5, 7, 11]
    end

    context "extreme case data" do
      let(:nil_statistic) { Statistic.new([]) }
      let(:statistic_2) { Statistic.new([1]) }

      it "doesn't broken" do
        expect(statistic_2.list).not_to be_nil
        expect(nil_statistic.list).not_to be_nil
      end
    end

    context "invalid list given" do
      let(:invalid_statistic) { Statistic.new(['a', 'b', 1]) }

      it "return nil" do
        expect(invalid_statistic.list).to be_nil
      end
    end
  end

  describe "#process" do
    let(:statistic_2) { Statistic.new([5, 3, 1, 7, 11, 6]) }
    let(:statistic_3) { Statistic.new([1, 1, 2, 3, 3, 3]) }
    let(:statistic_4) { Statistic.new([1]) }

    it "processing the data" do
      statistic.process
      statistic_2.process
      statistic_3.process
      statistic_4.process

      expect(statistic.mean).to eq 5.4
      expect(statistic.median).to eq 5
      expect(statistic_2.median).to eq 5.5
      # expect(statistic_3.mode).to eq 3
      expect(statistic.max).to eq 11
      expect(statistic.min).to eq 1
      expect(statistic_4.median).to eq 1
    end
  end
end
