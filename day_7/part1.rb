#!/usr/bin/env ruby

def median(array)
  return nil if array.empty?
  sorted = array.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

input = File.read("./input.txt").split(",").map(&:to_i)
target = median(input)

fuel = 0
input.each do |crab|
  fuel += (crab - target).abs
end
puts "FUEL: #{fuel.to_i}"
