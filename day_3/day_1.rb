#!/usr/bin/env ruby

input = File.readlines("./input.txt").map{|x| x.strip.split("").map(&:to_i)}
puts input.first

count_bits = []
(0..input.first.count-1).each do |x|
  count_bits[x] = [0,0]
end

input.each do |i|
  (0..i.count-1).each do |x|
    count_bits[x][i[x]] += 1
  end
end

most_significant = ""
count_bits.each do |x|
  most_significant += "#{x.each_with_index.max[1]}"
end
least_significant = ""
count_bits.each do |x|
  least_significant += "#{x.each_with_index.min[1]}"
end
puts most_significant
puts least_significant
puts most_significant.to_i(2) * least_significant.to_i(2)
