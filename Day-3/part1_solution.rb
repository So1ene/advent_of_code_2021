# Advent of Code Day 3 - Part 1 Solution.

# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp }

# Create empty arrays for gamma & epsilon
gamma = []
epsilon = []

# Create variable called index to keep track of position in each line
# For example 0101010101 first position is 0, second is 1, etc.
index = 0

# Find the length of one line of binary:
# (lines[0] looks at the first line, '.length' finds the length of that line)
x = lines[0].length

# loop x number of times (x being the length of one line):
x.times do
  ones = 0
  zeros = 0
  # ^ reset the counters to 0 at the start of each loop

  # Loop through each line of the file:

  lines.each do |binary|
    # Look at the digit at the position 'index' and determine if it's a 1 or 0
    if binary[index] == '1'
      # if it's a one, add to the counter 'ones'
      ones += 1
    else
      # else add to the counter 'zeros'
      zeros += 1
    end
  end

  # Compare the ones to the zeros
  if zeros > ones
    gamma << 0
    epsilon << 1
  else
    gamma << 1
    epsilon << 0
  end

  # Set the index to the next position in the line (ie, 2nd digit of each line)
  index += 1
end


# Convert arrays to strings, then convert strings to integer at base-2 (binary), then multiply together
# Example: gamma might be [0, 1, 0, 1] then using .join turns to string "0101", then .to_i(2) converts binary to integer at base-2
print "Solution is: "
puts gamma.join.to_i(2) * epsilon.join.to_i(2)
