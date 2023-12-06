# frozen_string_literal: true

def scratchcards_p1
  input_data = File.readlines('day_4/input.txt', chomp: true)
  transformed_data = input_data.map do |card|
    card.split(': ')[1]
        .split(' | ')
        .map { |numbers| numbers.split(' ') }
  end
  overall_total = 0
  transformed_data.each do |card|
    card_total = 0
    card[0].each do |winning_number|
      card[1].each_with_index.map do |number, i|
        if number == winning_number && card_total == 0
          card_total = 1
        elsif number == winning_number
          card_total *= 2
        end
      end
    end
    overall_total += card_total
  end
  pp overall_total
end

scratchcards_p1
