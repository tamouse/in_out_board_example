$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'in_out_board'

def build_time(h=nil,m=nil,s=nil,t=nil)
  t = Time.now if t.nil?
  Time.new(t.year,t.mon,t.day,h,m,s)
end
