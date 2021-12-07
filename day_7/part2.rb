#!/usr/bin/env ruby

input = File.read("./input.txt").split(",").map(&:to_i)

results = []
(input.min..input.max).each do |x|
  fuel = 0
  input.each do |crab|
    steps = (crab - x).abs
    fuel += (steps*(steps+1))/2
  end
  results << fuel.to_i
end
puts "MIN: #{results.min}"
