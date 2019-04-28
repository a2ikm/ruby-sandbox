#!/usr/bin/env ruby

def calc(exp)
  stack = exp.split(" ")
  loop do
    a = stack.pop
    case a
    when "+"
      x = stack.pop.to_i
      y = stack.pop.to_i
      z = x + y
      stack.push z
    when "-"
      x = stack.pop.to_i
      y = stack.pop.to_i
      z = x - y
      stack.push z
    else
      return a
    end
  end
end

if $0 == __FILE__
  require "test/unit/assertions"
  include Test::Unit::Assertions

  assert_equal 3, calc("1 2 +")
  assert_equal 1, calc("1 2 -")
end
