require 'spec_helper'

module InOutBoard
  
  describe ShiftTime do
    it{should be_a(ShiftTime)}
    context "happy path" do
      let(:h) {8}
      let(:m) {30}
      let(:st) {ShiftTime.new h,m}
      it "should store hours and minutes" do
        st.hours.should == h
        st.minutes.should == m
      end
      context "to_time" do
        let(:t) {st.to_time}
        it "should return a valid time" do
          t.should be_a(Time)
        end
        it "should have the right hours" do
          t.hour.should == h
        end
        it "should have the right minutes" do
          t.min.should == m
        end
      end
    end                         # end of happy path
  end
end
