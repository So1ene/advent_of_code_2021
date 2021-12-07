# Advent of Code Day 7 - Part 1 Solution.

def get_median(crabs)
  return nil if crabs.empty?
  sorted = crabs.sort
  len = sorted.length
  (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
end

file = File.open("puzzle_input.txt").read
crabs = file.split(',')
crabs.map!(&:to_i)

median = get_median(crabs)
fuel = 0

crabs.each do |crab|
  x, y = [crab, median].minmax
  fuel += (y - x)
end


print "Solution is: "
puts fuel.floor
