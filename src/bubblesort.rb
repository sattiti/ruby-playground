require 'pp'

ary = (0..20).to_a.shuffle
pp ary

ary.size.times do |i|
  (ary.size - 1).downto(i) do |j|
    if ary[j] < ary[j - 1]
      t = ary[j]
      ary[j] = ary[j - 1]
      ary[j - 1] = t
    end
  end
end

pp ary
