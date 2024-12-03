# frozen_string_literal: true

def seed_fertilizer
  input_data = File.readlines('day_5/example.txt', chomp: true)
  input_data[0].split(' ').slice(1..).map(&:to_i)
  data = input_data.slice(1..)
  maps = []
  group = []
  data.join(' ').scan(/\d+/).each_with_index do |number, index|
    maps[i] ||= []
    group << number.to_i
    maps << grou if index % 3 == 1
  end
  pp maps
end

seed_fertilizer
