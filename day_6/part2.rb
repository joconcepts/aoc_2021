#!/usr/bin/env ruby

fishes = File.read("./input.txt").split(",").map(&:to_i)
fish_hash = {}
fishes.each do |fish|
  fish_hash[fish] ||= 0
  fish_hash[fish] += 1
end

256.times.each do |day|
  new_fish_hash = {}
  new_fish_hash[6] = fish_hash[0]
  new_fish_hash[8] = fish_hash[0]
  (1..8).each do |i|
    new_fish_hash[i-1] ||= 0
    new_fish_hash[i-1] += fish_hash[i] || 0
  end
  fish_hash = new_fish_hash

  if [18, 80, 256].include?(day+1)
    puts fish_hash.sort.to_h
    puts "Day #{day+1}: #{fish_hash.inject(0){|sum,h| sum += h[1]}}"
  end
end
