# coding: utf-8

# 特異メソッド {{{
# 特異メソッド(Class method) はあるオブジェクトの固有メソッドを指す。
class Animal
  class << self
    def spark
      puts "hello!"
    end
  end

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

Animal.spark()

cat = Animal.new('cat')
puts cat.name
# }}}
