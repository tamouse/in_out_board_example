module InOutBoard
  class Shift
    attr_accessor :weekday, :shift_start, :shift_end
    def initialize(wd=nil,ss=nil,se=nil)
      wd = Time.now.wday if wd.nil?
      ss = ShiftTime.new if ss.nil?
      se = ShiftTime.new if se.nil?
      self.weekday=wd
      self.shift_start=ss
      self.shift_end=se
    end

    # Set the weekday for the shift, raising an error if it is not a
    # valid weekday (Integer from 0..6)
    def weekday=(wd)
      raise "Invalid weekday: #{wd}. Must be in (0..6)" unless (0..6).cover?(wd)
      @weekday = wd
    end

    # set the shift_start attribute only if the value sent in
    # is of class ShiftTimePoint
    def shift_start=(ss=nil)
      raise "Not a ShiftTimePoint" unless ss.is_a?(ShiftTime)
      @shift_start = ss
    end

    # set the shift_end attribute only if the value sent in
    # is of class ShiftTimePoint
    def shift_end=(se=nil)
      raise "Not a ShiftTimePoint" unless se.is_a?(ShiftTime)
      @shift_end = se
    end

    def covers?(t)
      (@shift_start.to_time .. @shift_end.to_time).cover?(t)
    end

  end
end
