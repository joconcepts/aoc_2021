#!/usr/bin/env ruby

input = File.readlines("./input1.txt").map(&:to_i)
output = input.map.with_index do |value,i|
  next if i == 0
  input[i-1] < value ? value : nil
end
puts output.compact.count
