#!/usr/bin/env ruby

input = File.readlines("./input.txt").map(&:strip)

OPENING = ["(", "[", "{", "<"]
CLOSING = [")", "]", "}", ">"]
VALUE   = [1, 2, 3, 4]

scores = []
input.each do |line|
  opened = []
  corrupted = false
  line.split("").each do |c|
    if OPENING.include?(c)
      opened << c
    elsif CLOSING.include?(c)
      pos = OPENING.index(opened.pop)
      if CLOSING[pos] != c
        corrupted = true
        break
      end
    end
  end
  unless corrupted
    closing = []
    opened.reverse.each do |o|
      closing << CLOSING[OPENING.index(o)]
    end
    score = 0
    closing.each do |c|
      score *= 5
      score += VALUE[CLOSING.index(c)]
    end
    scores << score
  end
end

puts scores.sort[scores.count / 2]
