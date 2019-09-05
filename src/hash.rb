# coding: utf-8

require 'pp'

# 多次元 hash の初期化
data = Hash.new {|h, k| h[k] = Hash.new(&h.default_proc)}
data[:a][:b][:c] = 'hello world'

pp data
