# Advent of Code Day 5 - Part 2 Solution.

# Represents a line segment
class Line
  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2
  end

  def coords
    # Shows every coord that the line covers.

    # If line is not diagonal:
    if @x1 == @x2 || @y1 == @y2
      if @y1 == @y2
        x_min, x_max = [@x1, @x2].minmax
        points = (x_min..x_max).map { |x| [x, @y1] }
      else
        y_min, y_max = [@y1, @y2].minmax
        points = (y_min..y_max).map { |y| [@x1, y] }
      end
    else
      # Else line is diagonal:
      x_range = @x1 < @x2 ? @x1.upto(@x2) : @x1.downto(@x2)
      y_range = @y1 < @y2 ? @y1.upto(@y2) : @y1.downto(@y2)
      points = x_range.zip(y_range)
    end
    points
  end
end

# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp }

line_objects = lines.map do |input_line|
  # Regex to match the x1, x2, y1 and y2
  match = input_line.match(/^(?<x1>\d+),(?<y1>\d+)\s->\s(?<x2>\d+),(?<y2>\d+)$/)

  # Initiate Line Object for each coord set
  Line.new(match[:x1].to_i, match[:y1].to_i, match[:x2].to_i, match[:y2].to_i)
end

# Get all points covered by lines:
points = line_objects.map do |line|
  line.coords
end

# Remove nil values (if any)
points.compact!

# Get all duplicate points:
found = {}
duplicates = []
points.flatten(1).each do |point|
  duplicates.push point if found[point]
  found[point] = true
end
duplicates.uniq!

# Count the amounts of duplicate points! :)
print "Solution is: "
p duplicates.count
