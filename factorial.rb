#!/usr/bin/env ruby

def factorial(n)
  factorial_internal(n, 1)
end

def factorial_internal(n, accum)
  case n
  when 0
    accum
  else
    factorial_internal(n - 1, n*accum)
  end
end

if $0 == __FILE__
  require "test/unit/assertions"
  include Test::Unit::Assertions

  assert_equal 1, factorial(0)
  assert_equal 1, factorial(1)
  assert_equal 3628800, factorial(10)
end
