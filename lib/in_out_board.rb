require "in_out_board/version"
require 'in_out_board/models/User'
require 'in_out_board/models/Shift'
require 'in_out_board/models/ShiftTime'

module InOutBoard

  class Board < Array
    def who_is_in(t=nil)
      self.select{|u| u.available?(t)}.map(&:username)
    end
    def who_is_up_next(t=nil)
      who_is_in(t).first
    end
  end
end
