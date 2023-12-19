def string_test(string)
  pp(string.each_char
           .with_object(Hash.new(0)) { |char, hash| hash[char] += 1 })
end

string_test('QQQJA')
string_test('KK677')