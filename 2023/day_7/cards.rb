# frozen_string_literal: true

def cards
  lines = File.readlines('day_7/example.txt', chomp: true)
  hand_bid_hash = lines.map { |line| line.split(' ') }.to_h
  hands = hand_bid_hash.keys
  five_of_a_kind = hands.map { |hand| hand.match?(/(.)\1{4}/) ? hand : nil }.compact
  four_of_a_kind = hands.map { |hand| hand.match?(/(.)\1{3}/) || hand.match?(/(.).\1{3}/) ? hand : nil }.compact - five_of_a_kind
  full_house = hands.map { |hand|
 hand.match?(/(.)\1(.)\2{2}/) || hand.match?(/(.)\1{2}(.)\2/) ? hand : nil }.compact - five_of_a_kind


  three_of_a_kind = hands.map { |hand| pp hand.chars.tally.values.sort }.sort
  pp three_of_a_kind
end

cards
