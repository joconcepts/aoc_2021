#!/usr/bin/env ruby

input = File.readlines("./input1.txt").map(&:to_i)
sum_of_three = input.map.with_index do |value,i|
  next if input[i+1].nil? || input[i+2].nil?
  input[i] + input[i+1] + input[i+2]
end.compact

output = sum_of_three.map.with_index do |value,i|
  next if i == 0
  sum_of_three[i-1] < value ? value : nil
end
puts output.compact.count
