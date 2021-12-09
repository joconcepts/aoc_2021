#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split("").map(&:to_i)
end

def find_adjecent(input,y,x)
  adjecent = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1]
  ]
  adjecent.map do |ad_y, ad_x|
    loc_y = y+ad_y
    loc_x = x+ad_x
    next if loc_y < 0 || loc_y > input.count-1
    next if loc_x < 0 || loc_x > input.first.count-1
    [loc_y,loc_x]
  end.compact
end

low_points = []
input.each.with_index do |line, y|
  line.each.with_index do |height, x|
    adjecents = find_adjecent(input,y,x).map{|adj_y, adj_x| input[adj_y][adj_x]}
    points = [adjecents, height].flatten
    min = points.min
    if points.select{|p| p == min && p == height}.count == 1
      low_points << [y,x]
    end
  end
end
puts "LOW POINTS: #{low_points.map{|y,x| input[y][x]}.join(', ')}"

def find_higher_neighbors(input,y,x)
  val = input[y][x]
  adjecents = find_adjecent(input,y,x)
  adjecents.each do |adj_y, adj_x|
    adj_val = input[adj_y][adj_x]
    if adj_val > val && adj_val < 9 && !$basin.include?([adj_y,adj_x])
      $basin << [adj_y, adj_x]
      find_higher_neighbors(input,adj_y,adj_x)
    end
  end
end

basins = []
low_points.each do |y,x|
  $basin = [[y,x]]
  find_higher_neighbors(input,y,x)
  puts $basin.map{|y,x| input[y][x]}.join(",")
  basins << $basin.count
end

puts basins.sort.last(3).inject(:*)
