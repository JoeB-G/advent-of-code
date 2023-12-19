# frozen_string_literal: true

def maps
  lines = File.readlines('day_8/input.txt', chomp: true)
  directions = lines[0]
  network = {}
  regex = /(?<keys>[A-Z]{3}) = \((?<lefts>[A-Z]{3}), (?<rights>[A-Z]{3})\)/
  lines.drop(2).map do |line|
    match_data = line.match(regex)
    network[match_data[:keys]] = [match_data[:lefts], match_data[:rights]]
  end

  current_element = 'AAA'
  steps = 0
  while current_element != 'ZZZ'
    directions.each_char do |char|
      steps += 1
      char == 'L' ? (current_element = network[current_element][0]) : (current_element = network[current_element][1])
    end
  end
  pp steps
end

maps
