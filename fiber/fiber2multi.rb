#!/usr/bin/env ruby

fiber1 = Fiber.new do
  puts "1 before yield"
  puts Fiber.yield
  puts "1 after  yield"
end

fiber2 = Fiber.new do
  puts "2 before yield"
  puts Fiber.yield
  puts "2 after  yield"
end

puts "---"

fiber1.resume 11
fiber2.resume 21
fiber1.resume 12
fiber2.resume 22
