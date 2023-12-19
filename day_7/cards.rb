def cards
  lines = File.readlines('day_7/example.txt', chomp: true)
  pp(lines.map { |line| line.split(' ') })
end

cards