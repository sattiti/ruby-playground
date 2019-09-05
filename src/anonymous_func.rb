# coding: utf-8

# Proc(edure) Object
# return が使える {{{
# ->(){}.call()
fn1 = ->(x, y){ x + y }
puts fn1.call(1, 2)

# lambda
sum = lambda {|x, y| x + y}
puts sum.call(2, 3)
# }}}
# return が使えない {{{
proc1 = Proc.new {|x, y| x + y}
puts proc1.call(3, 4)

proc2 = proc {|x, y| x + y}
puts proc2.call(5, 6)
# }}}
