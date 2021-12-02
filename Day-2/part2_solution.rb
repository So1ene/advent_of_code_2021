# Advent of Code Day 2 - Part 2 Solution.

POS = {
  x: 0,
  y: 0,
  aim: 0
}

def move_submarine(place)
  array = place.split

  direction = array[0]
  coord = array[1].to_i

  case direction
  when 'up' then POS[:aim] = POS[:aim] - coord
  when 'down' then POS[:aim] = POS[:aim] + coord
  when 'forward'
    POS[:x] = POS[:x] + coord
    POS[:y] = POS[:y] + (coord * POS[:aim])
  end
end

file = File.open("puzzle_input.txt")
pos_array = file.readlines.map { |pos| pos.chomp }

pos_array.each do |place|
  move_submarine(place)
end

print "Solution is: "
puts POS[:x] * POS[:y]
