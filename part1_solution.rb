# Advent of Code Day 1 - Part 1 Solution.

# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")

# Store numbers in array
numbers_array = file.readlines.map { |number| number.chomp.to_i }

# Make a counter to count the number of times a depth measurement
# increases from the previous measurement.
counter = 0

# Loop over numbers array with index:

numbers_array.each_with_index do |number, index|
  # Skip if it's the first number (at index 0):
  next if index.zero?

  # Add to the counter if the number is greater than the previous number
  counter += 1 if number > numbers_array[index - 1]
end

# Display solution in the terminal:
print "Solution is: "
puts counter
