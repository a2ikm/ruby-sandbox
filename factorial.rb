#!/usr/bin/env ruby

def factorial(n)
  case n
  when 0
    1
  else
    n * factorial(n-1)
  end
end

if $0 == __FILE__
  require "test/unit/assertions"
  include Test::Unit::Assertions

  assert_equal 1, factorial(0)
  assert_equal 1, factorial(1)
  assert_equal 3628800, factorial(10)
end
