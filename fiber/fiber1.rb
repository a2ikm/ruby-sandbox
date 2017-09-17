#!/usr/bin/env ruby

fiber = Fiber.new do
  puts "before yield"
  puts Fiber.yield
  puts "after  yield"
end

fiber.resume 1
