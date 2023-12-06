# frozen_string_literal: true

require 'pry'
def gear_ratios
  symbol_locations = []
  number_locations = {}
  current_number = ''
  current_number_locations = []
  result = []
  input_data = File.readlines('day_3/input.txt', chomp: true)
  input_data.each_with_index do |line, row|
    line.split('').each_with_index do |char, column|
      if char.match?(/[0-9]/)
        current_number += char
        current_number_locations << [row, column]
      elsif current_number != ''
        number_locations[current_number_locations] = current_number
        current_number_locations = []
        current_number = ''
      end
      symbol_locations << [row, column] if char.match?(/[^[0-9]^.]/)
    end
  end
  symbol_locations.each do |sym_loc|
    number_locations.each do |locations, number|
      locations.each do |num_loc|
        if ((num_loc[0] - 1)..(num_loc[0] + 1)).include?(sym_loc[0]) &&
           ((num_loc[1] - 1)..(num_loc[1] + 1)).include?(sym_loc[1])
          result << number
        end
      end
    end
  end
  pp(result.each_with_index { |_item, i| result[i] = nil if result[i] == result[i + 1] }.compact.map(&:to_i).sum)
end


gear_ratios
