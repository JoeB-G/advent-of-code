# def decode(code_string)
#   first_digit = code_string.match(/\d/)
#   last_digit = code_string.reverse.match(/\d/)
#   "#{first_digit}#{last_digit}".to_i
# end
#
# def decode_array
# input_data = File.readlines('data.txt', chomp: true)
# input_data.map { |item| decode(item) }
#             .sum
# end

def decode_part_2
  input_data = File.readlines('day_1/input_data.txt', chomp: true)
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

  first_digits = input_data.map { |item| item.match(re_forwards).to_s }
  last_digits = input_data.map { |item| item.reverse.match(re_backwards).to_s.reverse }

  pp first_digits
end
decode_part_2
