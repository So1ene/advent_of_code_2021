# Advent of Code Day 3 - Part 2 Solution.

file = File.open("puzzle_input.txt")
LINES = file.readlines.map { |line| line.chomp }

def filter(oxygen_or_co2)
  array = LINES
  index = 0
  LINES[0].length.times do
    next if array.length == 1

    ones = 0
    zeros = 0

    array.each { |binary| binary[index] == '1' ? ones += 1 : zeros += 1 }

    if oxygen_or_co2 == 'oxygen'
      array = array.select { |binary| zeros > ones ? binary[index] == '0' : binary[index] == '1' }
    else
      array = array.select { |binary| zeros > ones ? binary[index] == '1' : binary[index] == '0' }
    end

    index += 1
  end
  # return the final number as an integer:
  array.join.to_i(2)
end

oxygen = filter('oxygen')
co2 = filter('co2')

print "Solution is: "
puts co2 * oxygen
