# frozen_string_literal: true

def race_part1
  lines = File.readlines('day_6/part2.txt', chomp: true)
  times, distance = lines.map { |line| line.split.drop(1).map(&:to_i) }
  total = 1
  times.each_with_index do |time, index|
    hold = 1
    wins = 0
    while hold < time
      wins += 1 if hold * (time - hold) > distance[index]
      hold += 1
    end
    total *= wins
  end
  pp total
end

def race_part2
  lines = File.readlines('day_6/input.txt', chomp: true)
  times, distances = lines.map { |line| line.split.drop(1).map(&:to_i) }
  total = 1
  time = times.join('').to_i
  distance = distances.join('').to_i
  hold = 1
  wins = 0
  while hold < time
    wins += 1 if hold * (time - hold) > distance
    hold += 1
  end
  total *= wins
  pp total
end

race_part1
race_part2
