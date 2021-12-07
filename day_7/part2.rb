#!/usr/bin/env ruby

input = File.read("./input.txt").split(",").map(&:to_i)

results = []
(0..input.max).each do |x|
  fuel = 0
  input.each do |crab|
    steps = (crab - x).abs
    fuel += (1..steps).sum(0)
  end
  puts "FUEL: #{fuel.to_i}"
  results << fuel.to_i
end
puts "MIN: #{results.min}"
