# coding: utf-8


def doSomething(msg, &block)
  puts msg
  yield(msg)
end

doSomething 'hello world' do |block_msg|
  puts "block inside: #{block_msg.upcase}"
end
