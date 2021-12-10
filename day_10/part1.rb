#!/usr/bin/env ruby

input = File.readlines("./input.txt").map(&:strip)

OPENING = ["(", "[", "{", "<"]
CLOSING = [")", "]", "}", ">"]
VALUE   = [3, 57, 1197, 25137]

sum = 0
input.each do |line|
  opened = []
  line.split("").each do |c|
    if OPENING.include?(c)
      opened << c
    elsif CLOSING.include?(c)
      pos = OPENING.index(opened.pop)
      if CLOSING[pos] != c
        sum += VALUE[CLOSING.index(c)]
        break
      end
    end
  end
end
puts sum
