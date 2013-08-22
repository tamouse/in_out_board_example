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
        t = Time.new(Time.now.year,
                     Time.now.mon,
                     Time.now.day,
                     10,0,0)
        shift.covers?(t).should be_true
      end

      it "should not cover a time" do
        t = Time.new(Time.now.year,
                     Time.now.mon,
                     Time.now.day,
                     22,0,0)
        shift.covers?(t).should be_false
      end
    end                         # end happy path
  end
end
