# frozen_string_literal: true

require 'pry'
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

def maps_part2
  lines = File.readlines('day_8/input.txt', chomp: true)
  directions = lines[0]
  network = {}
  regex = /(?<keys>[A-Z]{3}) = \((?<lefts>[A-Z]{3}), (?<rights>[A-Z]{3})\)/
  lines.drop(2).each do |line|
    match_data = line.match(regex)
    network[match_data[:keys]] = [match_data[:lefts], match_data[:rights]]
  end

  positions = network.select { |key, _value| key.match(/..A/) }.keys
  steps = [0, 0, 0, 0, 0, 0]
  positions.map.with_index do |position, index|
    while position[2] != 'Z'
      directions.each_char do |char|
        steps[index] += 1
        char == 'L' ? (position = network[position][0]) : (position = network[position][1])
      end
    end
  end
  pp steps.reduce(1, :lcm)
end

maps_part2
