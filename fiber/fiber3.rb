#!/usr/bin/env ruby

fiber1 = Fiber.new do
  puts "1 top yield"
  puts Fiber.yield
  puts "1 middle  yield"
  puts Fiber.yield
  puts "1 bottom  yield"
end

fiber2 = Fiber.new do
  puts "2 top yield"
  puts Fiber.yield
  puts "2 middle  yield"
  puts Fiber.yield
  puts "2 bottom  yield"
end

puts "---"

fiber1.resume 11
fiber2.resume 21
fiber1.resume 12
fiber2.resume 22
