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
        if number == winning_number && card_total.zero?
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

def scratchcards_p2
  number_of_tickets = {}
  input_data = File.readlines('day_4/example.txt', chomp: true)
  transformed_data = input_data.map.with_index do |card, index|
    number_of_tickets[index] = 1
    card.split(': ')[1]
        .split(' | ')
        .map { |numbers| numbers.split(' ') }
  end
  ticket_results = []
  transformed_data.each_with_index do |card, index|
    card_total = 0
    number_of_wins = 0
    card[0].each do |winning_number|
      card[1].each do |number|
        if number == winning_number
          number_of_wins += 1
          number_of_tickets[index+number_of_wins] += 1
          if card_total.zero?
            card_total = 1
          else
            card_total *= 2
          end
        end
      end
    end
    ticket_results << card_total
    pp number_of_wins
  end
  pp ticket_results
  pp number_of_tickets
end

# scratchcards_p1
scratchcards_p2