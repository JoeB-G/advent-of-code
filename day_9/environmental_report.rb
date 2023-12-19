# frozen_string_literal: true

def environmental_report
  input = File.readlines('day_9/input.txt', chomp: true)
  reports = (input.map { |line| line.split(' ').map(&:to_i) })
  @results = {}
  reports.each_with_index do |report, index|
    @results[index] = [report.last]
    recursive_difference_array(report, index)
  end
  pp(@results.values.map(&:sum).sum)
end

def recursive_difference_array(array, storage)
  result = []
  array.each_with_index { |item, index| result << (array[index + 1] - item) if array.length > index + 1 }
  @results[storage] << result.last
  recursive_difference_array(result, storage) unless result.uniq.length == 1
end

environmental_report
