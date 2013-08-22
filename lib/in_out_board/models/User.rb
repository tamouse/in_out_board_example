module InOutBoard

  class User 

    include Enumerable;

    attr_accessor :username, :shifts
    
    def initialize(un=nil, sh=nil)
      un = "Anon" if un.nil?
      sh = Array.new if sh.nil?

      self.username = un
      @shifts = sh
    end
    
    def each(&b)
      @shifts.each do |shift|
        if block_given?
          block.call shift
        else
          yield shift
        end
      end
    end

    def <<(obj)
      @shifts << obj
    end

    def [](idx)
      @shifts[idx]
    end

    def []=(idx, obj)
      @shifts[idx]=obj
    end

    def available?(t=nil)
      t = Time.now if t.nil?
      @shifts.select{|s| s.weekday == t.wday}.any? {|shift| shift.covers?(t)}
    end

  end
end
