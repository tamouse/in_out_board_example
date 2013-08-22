require 'spec_helper'

module InOutBoard

  describe Shift do
    it {should be_a(Shift)}
    context "happy path" do
      let(:wd) {0}
      let(:ss) {ShiftTime.new 8,30}
      let(:se) {ShiftTime.new 17,00}
      let(:shift) {Shift.new wd, ss, se}
      it "should cover a time" do
        t = build_time(10,0,0)
        shift.covers?(t).should be_true
      end

      it "should not cover that last minute of shift" do
        t = build_time(17,0,0)
        shift.covers?(t).should be_false
      end

      it "should cover up to the previous second of shift" do
        t = build_time(16,59,59)
        shift.covers?(t).should be_true
      end

      it "should not cover a time" do
        t = build_time(22,0,0)
        shift.covers?(t).should be_false
      end
    end                         # end happy path
  end
end
