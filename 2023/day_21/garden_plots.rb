# frozen_string_literal: true

PLOT_HASH = {}
def garden_plots
  lines = File.readlines('day_21/input.txt', chomp: true)
  lines.each_with_index do |line, row|
    line.each_char.with_index { |char, column| PLOT_HASH[[row, column]] = char }
  end
  garden_step([PLOT_HASH.key('S')], 0)
  PLOT_HASH.values.count('O')
end

def garden_step(start_points, steps = 0)
  next_starts = []
  start_points.each do |start|
    PLOT_HASH[start] = '.'
    if PLOT_HASH[[start[0] + 1, start[1]]] == '.'
      PLOT_HASH[[start[0] + 1, start[1]]] = 'O'
      next_starts << [start[0] + 1, start[1]]
    end
    if PLOT_HASH[[start[0] - 1, start[1]]] == '.'
      PLOT_HASH[[start[0] - 1, start[1]]] = 'O'
      next_starts << [start[0] - 1, start[1]]
    end
    if PLOT_HASH[[start[0], start[1] + 1]] == '.'
      PLOT_HASH[[start[0], start[1] + 1]] = 'O'
      next_starts << [start[0], start[1] + 1]
    end
    if PLOT_HASH[[start[0], start[1] - 1]] == '.'
      PLOT_HASH[[start[0], start[1] - 1]] = 'O'
      next_starts << [start[0], start[1] - 1]
    end
  end
  steps += 1
  garden_step(next_starts, steps) unless steps == 64
end

pp garden_plots
