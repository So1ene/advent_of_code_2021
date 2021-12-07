# Advent of Code Day 7 - Part 2 Solution.

def get_median(crabs)
  return nil if crabs.empty?
  sorted = crabs.sort
  len = sorted.length
  median = (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  median.floor
end

def get_mean(crabs)
  crabs.sum.to_f / crabs.size
end

file = File.open("puzzle_input.txt").read
crabs = file.split(',')
crabs.map!(&:to_i)

median = get_median(crabs)
mean = get_mean(crabs)

range = median < mean ? median.upto(mean.ceil) : median.downto(mean.floor)

fuel = range.map do |v|
  diff = crabs.map do |crab|
    n = (v - crab).abs
    n * (n + 1) / 2
  end

  diff.sum
end

min_fuel = fuel.min

print "Solution is: "
puts min_fuel
