require 'spec_helper'

module InOutBoard
  
  describe User do
    it{should be_a(User)}
    context "happy path" do
      let(:time_now){Time.now}
      let(:yesterday){((time_now.wday-1)%7).abs}
      let(:today){time_now.wday}
      let(:tomorrow){((time_now.wday+1)%7).abs}
      let(:shifts) do
        [Shift.new(yesterday,ShiftTime.new(8,30),ShiftTime.new(15,0)),
         Shift.new(today,ShiftTime.new(8,30),ShiftTime.new(17,0)),
         Shift.new(tomorrow,ShiftTime.new(8,0),ShiftTime.new(12,0)),
         Shift.new(tomorrow,ShiftTime.new(13,0),ShiftTime.new(17,0))
        ]
      end
      let(:fred) {User.new("fred",shifts)}
      it "should be available" do
        t = Time.new(time_now.year,
                     time_now.month,
                     time_now.day, 10, 15, 0)
        fred.available?(t).should be_true
      end
      it "should not be available" do
        t = Time.new(time_now.year,
                     time_now.month,
                     time_now.day, 5, 0, 0)
        fred.available?(t).should be_false
      end


    end

  end

end
