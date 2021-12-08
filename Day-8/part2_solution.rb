# Advent of Code Day 8 - Part 2 Solution.

file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp.split('|').map(&:split) }


# VERY messy code, sorry!
def map_numbers(nums, values)
  fives_twos_or_threes = nums.select { |num| num.length == 5 }
  nines_sixes_or_zeros = nums.select { |num| num.length == 6 }
  map = {}

  # Find top position
  top = values[7].chars - values[1].chars
  map[:top] = top.join
  
  # Find number 3  
  three = fives_twos_or_threes.select do |num|
    num.chars.include?(values[1].chars[0]) && num.chars.include?(values[1].chars[1])
  end
  values[3] = three.join

  # Find bottom and bottom_left position
  bottom_or_bottomleft = values[8].chars - values[1].chars - values[7].chars - values[4].chars
  bottom_left = bottom_or_bottomleft - values[3].chars
  bottom = bottom_or_bottomleft - bottom_left
  map[:bottom] = bottom.join
  map[:bottom_left] = bottom_left.join
  
  # Find number 2
  two = fives_twos_or_threes.select do |num|
    num.chars.include?(map[:bottom_left])
  end
  values[2] = two.join

  # Find number 5
  five = fives_twos_or_threes - two - three
  values[5] = five.join

  # Find number 9
  not_nine = nines_sixes_or_zeros.select do |num|
    num.chars.include?(map[:bottom_left])
  end
  nine = nines_sixes_or_zeros - not_nine
  values[9] = nine.join

  # Find number 6 and 0
  zero = not_nine.select do |num|
    num.chars.include?(values[1].chars[0]) && num.chars.include?(values[1].chars[1])
  end
  six = not_nine - zero
  values[0] = zero.join
  values[6] = six.join

  values
end

results = lines.map do |array|
  array.each { |a| a.map! { |s| s.chars.sort.join }}
  
  values = {}
  array[0].each do |num|
      case num.length
      when 2 then values[1] = num
      when 4 then values[4] = num
      when 3 then values[7] = num
      when 7 then values[8] = num
      end 
  end

  values = map_numbers(array[0], values)
  
  output = array[1].map do |num|
    values.key(num)
  end

  output.join.to_i
end

print "Solution is: "
puts results.sum
