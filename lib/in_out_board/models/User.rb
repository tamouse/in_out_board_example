module InOutBoard

  class User 

    attr_accessor :username, :shifts
    
    def initialize(un=nil, sh=nil)
      self.username = un ||= 'Anon'
      @shifts       = sh ||= Array.new
    end

    def available?(t=nil)
      t ||= Time.now
      @shifts.select{|s| s.weekday == t.wday}.any? {|shift| shift.covers?(t)}
    end

  end
end
