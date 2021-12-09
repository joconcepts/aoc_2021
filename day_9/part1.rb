#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split("").map(&:to_i)
end

adjecent = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1]
]

low_points = []
input.each.with_index do |line, y|
  line.each.with_index do |height, x|
    adjecents = adjecent.map do |ad_y, ad_x|
      loc_y = y+ad_y
      loc_x = x+ad_x
      next if loc_y < 0 || loc_y > input.count-1
      next if loc_x < 0 || loc_x > line.count-1
      val = input[loc_y][loc_x]
      val
    end.compact
    points = [adjecents, height].flatten
    min = points.min
    if points.select{|p| p == min && p == height}.count == 1
      low_points << height
    end
  end
end
puts "LOW POINTS: #{low_points.join(', ')}"
sum = 0
low_points.each do |lp|
  sum += 1+lp
end
puts sum
