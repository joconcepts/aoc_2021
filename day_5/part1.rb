#!/usr/bin/env ruby

max_x = 0
max_y = 0
input = File.readlines("./input.txt").map do |lines|
  start_point, end_point = lines.split(" -> ")
  x1, y1 = start_point.split(",").map(&:to_i)
  x2, y2 = end_point.split(",").map(&:to_i)
  next if x1 != x2 && y1 != y2
  x = [x1, x2].sort
  y = [y1, y2].sort
  max_x = x.last if x.last > max_x
  max_y = y.last if y.last > max_y
  [x,y]
end.compact

diagram = []
(0..(max_y+1)).each do |y|
  diagram[y] = [0]*(max_x+1)
end

diagram.each do |row|
  puts row.join("")
end

input.each do |x,y|
  start_x, end_x = x
  start_y, end_y = y
  puts "(#{start_x}, #{start_y}) -> (#{end_x}, #{end_y})"

  if start_x != end_x
    (start_x..end_x).each do |i|
      diagram[start_y][i] += 1
    end
  end
  if start_y != end_y
    (start_y..end_y).each do |i|
      diagram[i][start_x] += 1
    end
  end
end

diagram.each do |row|
  puts row.join("")
end
puts
puts diagram.flatten.select{|x| x > 1}.count
