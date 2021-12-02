# Advent of Code Day 2 - Part 1 Solution.

# Create a Hash called POS
POS = {
  x: 0,
  y: 0
}

# Create a method to move submarine:

def move_submarine(place)
  # Split the 'place' string where there is a space (turns into an array like ["up", "1"])
  array = place.split

  # Direction is the first element of array
  direction = array[0]

  # Coord is the second element. Convert it to an integer.
  coord = array[1].to_i

  # Reassign the values inside the POS hash depending on value of direction:

  case direction
  when 'forward' then POS[:x] = POS[:x] + coord
  when 'up' then POS[:y] = POS[:y] - coord
  when 'down' then POS[:y] = POS[:y] + coord
  end
end

# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")

# Store positions in array
pos_array = file.readlines.map { |pos| pos.chomp }

# For each position, move submarine
pos_array.each do |place|
  move_submarine(place)
end

# Display solution in the terminal
print "Solution is: "
puts POS[:x] * POS[:y]
