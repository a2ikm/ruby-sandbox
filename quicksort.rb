#!/usr/bin/env ruby

def quicksort(array)
  return [] if array.empty?

  pivot = array.shift
  smaller, equal, larger = partition(pivot, array)
  quicksort(smaller) + [pivot] + equal + quicksort(larger)
end

def partition(pivot, array)
  smaller, equal, larger = [], [], []
  array.each do |item|
    if item < pivot
      smaller << item
    elsif item > pivot
      larger << item
    else
      equal << item
    end
  end
  return smaller, equal, larger
end

if $0 == __FILE__
  require "test/unit/assertions"
  include Test::Unit::Assertions

  assert_equal [], quicksort([])
  assert_equal [1, 2, 3, 4, 5], quicksort([3, 2, 4, 5, 1])
end
