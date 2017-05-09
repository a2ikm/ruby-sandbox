require "rblineprof"

def a
  100.times do
    b
  end
end

def b
  100.times do
    c
  end
end

def c
  100.times do
    "hello"
  end
end

profile = lineprof(/./) do
  a
end

file = profile.keys.first

File.readlines(file).each_with_index do |line, num|
  wall, cpu, calls, allocations = profile[file][num + 1]

  if wall > 0 || cpu > 0 || calls > 0
    printf(
      "% 5.1fms + % 6.1fms (% 6d) | %s",
      cpu / 1000.0,
      (wall - cpu) / 1000.0,
      calls,
      line
    )
  else
    printf "                            | %s", line
  end
end
