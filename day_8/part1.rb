#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  wires, digits = line.split(" | ")
  digits.split(" ")
end

# 1, 4, 7, 8 => 2, 4, 3, 7


puts input.flatten.select{|x| [2,4,3,7].include?(x.length)}.count
