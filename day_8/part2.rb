#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  wires, digits = line.split(" | ")
  wires = wires.split(" ").map{|x| x.split("")}
  digits = digits.split(" ").map{|x| x.split("")}
  {wires: wires, digits: digits}
end

sum = 0
input.each do |data|
  patterns = {}
  patterns[8] = data[:wires].find{|x| x.length == 7}
  patterns[7] = data[:wires].find{|x| x.length == 3}
  patterns[4] = data[:wires].find{|x| x.length == 4}
  patterns[1] = data[:wires].find{|x| x.length == 2}

  display = {}
  display[:top] = patterns[7] - patterns[1]
  display[:bottom] = data[:wires].find do |x|
    (x - patterns[7] - patterns[4]).count == 1
  end - patterns[7] - patterns[4]
  display[:middle] = data[:wires].find do |x|
    (x - patterns[7] - display[:bottom]).count == 1
  end - patterns[7] - display[:bottom]

  patterns[3] = (patterns[7] + display[:middle] + display[:bottom]).uniq
  display[:bottom_left] = patterns[8] - patterns[3] - patterns[4]
  display[:top_left] = patterns[4] - patterns[3]

  a = data[:wires].select do |x|
    (x - display[:top] - display[:middle] - display[:bottom] - display[:top_left]).count == 1
  end
  display[:bottom_right] = a.first - display[:top] - display[:middle] - display[:bottom] - display[:top_left] - display[:bottom_left]
  display[:top_right] = patterns[7] - display[:top] - display[:bottom_right]

  patterns[0] = patterns[7] + display[:bottom] + display[:top_left] + display[:bottom_left]
  patterns[2] = display[:top] + display[:middle] + display[:bottom] + display[:top_right] + display[:bottom_left]
  patterns[3] = patterns[1] + display[:top] + display[:middle] + display[:bottom]
  patterns[5] = display[:top] + display[:middle] + display[:bottom] + display[:bottom_right] + display[:top_left]
  patterns[6] = patterns[8] - display[:top_right]
  patterns[9] = patterns[8] - display[:bottom_left]

  value = data[:digits].map do |digit|
    patterns.find do |k,v|
      v.sort == digit.sort
    end.first
  rescue
    puts display
    puts patterns.map{|k,v| "#{k} => #{v.sort.join('')}"}
    puts digit.sort.join("")
    raise
  end
  puts value.join("").to_i
  sum += value.join("").to_i
end
puts sum
