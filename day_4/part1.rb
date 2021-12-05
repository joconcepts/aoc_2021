#!/usr/bin/env ruby

input = File.read("./input.txt")
parts = input.split("\n\n")
numbers = parts.first.split(",").map(&:to_i)

boards = parts[1..-1].map do |board_block|
  board_block.split("\n").map do |row|
    row.split.compact.map(&:to_i)
  end
end

def board_wins?(board)
  board.each do |row|
    return true if row.compact.count == 5 
  end
  board.transpose.map(&:reverse).each do |row|
    return true if row.compact.count == 5
  end
  false
end

marked_fields = []

called_number = nil
won_board = nil
catch :board_won do
  numbers.each do |number|
    called_number = number
    boards.each.with_index do |board, board_index|
      marked_fields[board_index] ||= []
      board.each.with_index do |row, row_index|
        marked_fields[board_index][row_index] ||= [nil]*5
        row.each.with_index do |column, column_index|
          if column == number
            marked_fields[board_index][row_index][column_index] = true
          end
        end
      end
    end
    marked_fields.each.with_index do |board, board_index|
      if board_wins?(board)
        won_board = board_index
        throw :board_won
      end
    end
  end
end

puts "Winning number: #{called_number}"
sum = 0
boards[won_board].each.with_index do |row, row_index|
  row.each.with_index do |column, column_index|
    sum += column unless marked_fields[won_board][row_index][column_index]
  end
end
puts "Sum: #{sum}"
puts "Result: #{sum*called_number}"
