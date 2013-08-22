
module InOutBoard

  # Shift time start or end point, hours and minutes
  class ShiftTime
    attr_accessor :hours, :minutes
    def initialize(h=nil, m=nil)
      self.hours=h
      self.minutes=m
    end

    # convert the object to a Time object based on the current date
    def to_time(t=nil)
      t ||=Time.now
      Time.new(t.year,t.month,t.day,@hours,@minutes,0)
    end
  end

end
