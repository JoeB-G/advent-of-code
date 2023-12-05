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
    @result += (index + 1) if item
  end

  pp @result
end


def cube_conundrum_p2
  @total = 0
  input_data = File.readlines('day_2/input.txt', chomp: true)
  input_data.map { |line| line.split(': ') }
            .map do |pull|
    count = {
      'red' => 0,
      'green' => 0,
      'blue' => 0
    }
    pull[1].split('; ')
           .map do |item|
      item.split(', ')
          .map { |draw| draw.split(' ') }
          .map { |colour| count[colour[1]] = colour[0].to_i if colour[0].to_i > count[colour[1]]}
    end
    @total += count['red'] * count['green'] * count['blue']
  end
  pp @total
end

cube_conundrum_p2
