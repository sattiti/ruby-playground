# coding: utf-8

require 'pp'

# 多次元 hash の初期化 {{{
data = Hash.new {|h, k| h[k] = Hash.new(&h.default_proc)}
data[:a][:b][:c] = 'hello world'

pp data
#}}}

# 多重動的ハッシュ生成 {{{
path      = ['about', 'me', 'index']
nest_hash = Hash.new{|h, k| h[k] = Hash.new(&h.default_proc)}
path.inject(nest_hash, :[])
pp nest_hash
# }}}