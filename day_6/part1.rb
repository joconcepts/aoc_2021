#!/usr/bin/env ruby

fishes = File.read("./input.txt").split(",").map(&:to_i)

80.times.each do |i|
  new_fishes = []
  fishes.each do |fish|
    case fish
    when 0
      new_fishes << 6
      new_fishes << 8
    else
      new_fishes << fish-1
    end
  end
  fishes = new_fishes

  if [17, 79].include? i
    puts fishes.count
  end
end
