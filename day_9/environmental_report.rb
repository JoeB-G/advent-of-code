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

def environmental_report_part2
  input = File.readlines('day_9/input.txt', chomp: true)
  reports = (input.map { |line| line.split(' ').map(&:to_i) })
  @results2 = {}
  reports.each_with_index do |report, index|
    @results2[index] = [report.first]
    recursive_difference_array2(report, index)
  end
  start_values = []
  first_elements = @results2.values
  first_elements.map! do |result|
    start_values << result[0]
    result.drop(1).map.with_index { |element, index| index.odd? ? -element : element }.sum
  end
  pp start_values.map.with_index { |item, index| item - first_elements[index] }.sum
end

def recursive_difference_array2(array, storage)
  result = []
  array.each_with_index { |item, index| result << (array[index + 1] - item) if array.length > index + 1 }
  @results2[storage] << result.first
  recursive_difference_array2(result, storage) unless result.uniq.length == 1
end

environmental_report_part2
