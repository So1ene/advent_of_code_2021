# Advent of Code Day 1 - Part 2 Solution.

# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")

# Store numbers in array
numbers_array = file.readlines.map { |number| number.chomp.to_i }

# Make a counter to count the number of times a depth measurement
# sum increases from the previous 3-number sum.
# Also make a blank variable called 'prev_sum'
counter = 0
prev_sum = nil

# Loop over numbers array with index:

numbers_array.each_with_index do |number, index|
  # Skip if it's the first or second number (Start loop at the 3rd number)
  next if index.zero? || index == 1

  # Calculate the sum of the 3 numbers
  sum = number + numbers_array[index - 1] + numbers_array[index - 2]

  # Add to the counter if the sum is greater than the previous sum (and the prev_sum is not nil)
  counter += 1 if prev_sum && sum > prev_sum

  # Assign prev_sum to the value of sum for the next loop:
  prev_sum = sum
end

# Display solution in the terminal:
print "Solution is: "
puts counter
