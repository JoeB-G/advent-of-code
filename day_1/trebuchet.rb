# frozen_string_literal: true

def decode(code_string)
  first_digit = code_string.match(/\d/)
  last_digit = code_string.reverse.match(/\d/)
  "#{first_digit}#{last_digit}".to_i
end

def calibration_value
  input_data = File.readlines('day_1/data.txt', chomp: true)
  input_data.map { |item| decode(item) }
            .sum
end

def calibration_value2
  input_data = File.readlines('day_1/data.txt', chomp: true)
  input_data.map { |item| decode_part2(item) }
            .sum
end

def decode_part2(string)
  word_values = {
    'one'   => '1',
    'two'   => '2',
    'three' => '3',
    'four'  => '4',
    'five'  => '5',
    'six'   => '6',
    'seven' => '7',
    'eight' => '8',
    'nine'  => '9'
  }
  re_forwards = /one|two|three|four|five|six|seven|eight|nine|\d/
  re_backwards = /eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|\d/

  first_digit = string.match(re_forwards).to_s
  last_digit = string.reverse.match(re_backwards).to_s.reverse

  first_digit = word_values[first_digit] unless word_values[first_digit].nil?
  last_digit = word_values[last_digit] unless word_values[last_digit].nil?
  "#{first_digit}#{last_digit}".to_i
end

pp calibration_value
pp calibration_value2
