#!/usr/bin/env ruby

input = File.readlines("./input.txt")

h = 0
d = 0

input.each do |line|
  action, value = line.split(" ")
  value = value.to_i
  case action
  when "forward"
    h += value
  when "down"
    d += value
  when "up"
    d -= value
  end
end

puts d*h
