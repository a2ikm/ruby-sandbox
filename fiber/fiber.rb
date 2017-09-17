#!/usr/bin/env ruby

@fibers = {}

def create_fiber
  Fiber.new do
    puts Fiber.yield
    sleep 3
    puts Fiber.yield
  end
end

fibers = []
fibers << create_fiber
fibers << create_fiber

puts "begin"
fibers.each(&:resume)
puts "end"

fibers.each { |f| f.resume 1; f.resume 2 }
