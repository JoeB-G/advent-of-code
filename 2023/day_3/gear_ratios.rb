# frozen_string_literal: true

require 'pry'
def gear_ratios_p1
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
  pp symbol_locations
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

def gear_ratios_p2
  star_locations = []
  number_locations = {}
  current_number = ''
  current_number_locations = []
  result = {}
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
      star_locations << [row, column] if char.match?(/[*]/)
    end
  end
  star_locations.each do |star_loc|
    result[star_loc] = []
    number_locations.each do |locations, number|
      locations.each do |num_loc|
        if ((num_loc[0] - 1)..(num_loc[0] + 1)).include?(star_loc[0]) &&
           ((num_loc[1] - 1)..(num_loc[1] + 1)).include?(star_loc[1])
          result[star_loc] << number
        end
      end
    end
  end
  paired_results = result.each do |star, numbers|
    result[star] = numbers.uniq
    if result[star].length == 1
      result.delete(star)
    end
  end
  total = 0
  paired_results.each_value { |numbers| total += numbers[0].to_i * numbers[1].to_i }
  pp total
end

gear_ratios_p1
gear_ratios_p2
