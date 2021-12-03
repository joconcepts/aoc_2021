#!/usr/bin/env ruby

input_raw = File.readlines("./input.txt").map{|x| x.strip.split("").map(&:to_i)}
data = input_raw.dup

def counter(input:)
  count_bits = []
  (0..input.first.count-1).each do |x|
    count_bits[x] = [0,0]
  end
  input.each do |i|
    (0..i.count-1).each do |x|
      count_bits[x][i[x]] += 1
    end
  end
  count_bits
end

data = input_raw.dup
(0..input_raw.first.count-1).each do |pos|
  counted = counter(input: data)
  most_significant = counted[pos].each_with_index.max[1]
  data = data.select{|x| x[pos] == most_significant}
  break if data.count == 1
end
oxygen = data.join("").to_i(2)

data = input_raw.dup
(0..input_raw.first.count-1).each do |pos|
  counted = counter(input: data)
  least_significant = counted[pos].each_with_index.min[1]
  data = data.select{|x| x[pos] == least_significant}
  break if data.count == 1
end
co2 = data.join("").to_i(2)

puts "#{oxygen} #{co2} -> #{oxygen * co2}"
