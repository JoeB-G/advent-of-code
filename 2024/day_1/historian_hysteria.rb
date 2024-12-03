# frozen_string_literal: true

def part_1
  left = []
  right = []
  total = 0

  File.foreach('2024/day_1/data.txt', chomp: true) do |line|
    separated_line = line.split('   ')
    left << separated_line.first
    right << separated_line.last
  end

  left.sort!.zip(right.sort!).each { |pair| total += (pair.first.to_i - pair.last.to_i).abs }
  pp total
end

def part_2
  left = []
  right = []

  File.foreach('2024/day_1/data.txt', chomp: true) do |line|
    separated_line = line.split('   ')
    left << separated_line.first
    right << separated_line.last
  end
  right_tally = right.tally
  results_array = left.map do |id|
    right_tally[id] ||= '0'
    id.to_i * right_tally[id].to_i
  end

  pp results_array.sum
end

part_2
