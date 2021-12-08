# Advent of Code Day 8 - Part 1 Solution.


file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp.split('|').map(&:split) }

ones = 0
fours = 0
sevens = 0
eights = 0

lines.each do |array|
    array[1].each do |num|
        case num.length
        when 2 then ones += 1
        when 4 then fours += 1
        when 3 then sevens += 1
        when 7 then eights += 1
        end
    end
end

print "Solution is: "
puts ones + fours + sevens + eights
