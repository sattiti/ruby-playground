require 'pp'
require 'benchmark'

ary = ((0..9999).to_a).shuffle

def quickSort(seq)
  return seq if seq.size < 1
  pivot = seq[0]
  left  ||= []
  right ||= []

  (1..seq.size - 1).each do |i|
    if seq[i] <= pivot
      left.push(seq[i]) 
    else
      right.push(seq[i])
    end
  end
  left  = quickSort(left)
  right = quickSort(right)
  left.concat([pivot]).concat(right)
end

# puts Benchmark::CAPTION
# puts Benchmark.measure {quickSort(ary)}
pp quickSort ary
