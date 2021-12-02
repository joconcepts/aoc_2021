#!/usr/bin/env ruby

input = File.readlines("./input.txt")

h = 0
a = 0
d = 0

input.each do |line|
  action, value = line.split(" ")
  value = value.to_i
  case action
  when "forward"
    h += value
    d += a * value
  when "down"
    a += value
  when "up"
    a -= value
  end
end

puts d*h
