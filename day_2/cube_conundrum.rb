# frozen_string_literal: true

MAXES = {
  'red' => 12,
  'green' => 13,
  'blue' => 14
}.freeze
def cube_conundrum
  input_data = File.readlines('day_2/input.txt', chomp: true)
  transformed_data = input_data.map { |line| line.split(': ') }
                               .map do |pull|
    pull[1].split('; ')
           .map do |item|
      item.split(', ')
          .map { |draw| draw.split(' ') }
          .map { |colour| colour[0].to_i <= MAXES[colour[1]] }.all?
    end.all?
  end

  @result = 0
  transformed_data.each_with_index do |item, index|
    if item
      @result += (index + 1)
    end
  end

  pp @result
end

cube_conundrum
