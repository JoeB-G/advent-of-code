input_data = File.readlines('data.txt', chomp: true)

def decode(code_string)
  first_digit = code_string.match(/\d/)
  last_digit = code_string.reverse.match(/\d/)
  "#{first_digit}#{last_digit}".to_i
end

def decode_array(code_array)
  code_array.map { |item| decode(item) }
            .sum
end

def decode_part_2(code_string)
  first_digit = code_string.match(/\d/)
  last_digit = code_string.reverse.match(/\d/)
  "#{first_digit}#{last_digit}".to_i
end
decode_array(input_data)
