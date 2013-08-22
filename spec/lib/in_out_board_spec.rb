require 'spec_helper'

module InOutBoard

  describe Board do
    it{should be_a(Board)}

    context "happy path" do
      let(:time_now) {Time.now}
      let(:today) {time_now.wday}
      let(:yesterday) {((time_now.wday-1)%7).abs}
      let(:tomorrow) {((time_now.wday+1)%7).abs}

      let(:fred) do
        User.new("fred",
                 [Shift.new(yesterday,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0)),
                  Shift.new(today,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0))
                 ])
      end
      let(:barney) do
        User.new("barney",
                 [Shift.new(yesterday,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0)),
                  Shift.new(today,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(9,0),
                            ShiftTime.new(10,0))
                 ])
      end

      let(:wilma) do
        User.new("wilma",
                 [Shift.new(yesterday,
                            ShiftTime.new(10,30),
                            ShiftTime.new(11,0)),
                  Shift.new(today,
                            ShiftTime.new(10,30),
                            ShiftTime.new(11,0)),
                  Shift.new(today,
                            ShiftTime.new(13,0),
                            ShiftTime.new(14,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(10,0),
                            ShiftTime.new(11,0))
                 ])
      end

      let(:betty) do
        User.new("betty",
                 [Shift.new(yesterday,
                            ShiftTime.new(10,30),
                            ShiftTime.new(11,0)),
                  Shift.new(today,
                            ShiftTime.new(10,30),
                            ShiftTime.new(11,0)),
                  Shift.new(today,
                            ShiftTime.new(13,0),
                            ShiftTime.new(14,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(10,0),
                            ShiftTime.new(11,0))
                 ])
      end

      
      let(:pebbles) do
        User.new("pebbles",
                 [Shift.new(yesterday,
                            ShiftTime.new(12,30),
                            ShiftTime.new(13,00)),
                  Shift.new(today,
                            ShiftTime.new(15,0),
                            ShiftTime.new(16,0)),
                  Shift.new(today,
                            ShiftTime.new(17,0),
                            ShiftTime.new(18,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(12,30),
                            ShiftTime.new(13,45))
                 ])
      end
      
      let(:bambam) do
        User.new("bambam",
                 [Shift.new(yesterday,
                            ShiftTime.new(12,30),
                            ShiftTime.new(13,00)),
                  Shift.new(today,
                            ShiftTime.new(15,0),
                            ShiftTime.new(16,0)),
                  Shift.new(today,
                            ShiftTime.new(17,0),
                            ShiftTime.new(18,0)),
                  Shift.new(tomorrow,
                            ShiftTime.new(12,30),
                            ShiftTime.new(13,45))
                 ])
      end
      
      let(:board) do
        Board.new [fred, barney, wilma, betty, pebbles, bambam]
      end

      [['fred','barney'],['wilma','betty'],['pebbles','bambam']].each do |pairs|
        case pairs
        when ['fred','barney']
          pairs_times = [[9,15],[9,45]]
        when ['wilma','betty']
          pairs_times = [[10,45],[13,15]]
        when ['pebbles','bambam']
          pairs_times = [[15,7],[17,29]]
        end
        pairs_times.each do |time_frame|
          context "#{"%02d:%02d" % time_frame}" do
            let(:available){pairs}
            let(:now) {build_time(time_frame.first, time_frame.last)}

            it "should give a list of who is in: #{pairs}" do
              board.who_is_in(now).should == available
            end
            it "should should give first available person: #{pairs.first}" do
              board.who_is_up_next(now).should == available.first
            end
          end                   # of context #{time_frame}
        end                     # of pairs_times.each
      end                       # of pairs.each

      context "no one in" do
        let(:now) {build_time(3,0)} # 3am
        it "should show no one is available" do
          board.who_is_in(now).should == []
        end
        it "should give nil for next person" do
          board.who_is_up_next(now).should be_nil
        end
      end                       # context no one in

    end                         # of context happy path
  end
end
