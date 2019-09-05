# coding: utf-8

ary  = ['about', 'me', 'index']
data = Hash.new{|h, k| h[k] = Hash.new(&h.default_proc)}
ary.inject(data, :[])
$val = 1

g = ->(h){
  h.each do |k, v|
    if v.keys.size > 0
      g.call(v)
    else
      h[h.keys.join('')] = $val
    end
  end
}

pp g.call(data)
