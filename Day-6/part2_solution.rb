# Advent of Code Day 6 - Part 2 Solution. 

# (More scalable solution)


class Lanternfish
  def initialize(initial_states)
    # initial_states = [3, 4, 3, 1, 2, etc]
    @all_fish = Hash.new(0)
    initial_states.each do |key|
      @all_fish[key] += 1
    end
  end

  def simulate_days(days)
    days.times do
      temp_hash = Hash.new(0)
      @all_fish.each_key do |key|
        if key.zero?
          temp_hash[6] += @all_fish[0]
          temp_hash[8] += @all_fish[0]
        else
          temp_hash[key - 1] += @all_fish[key]
        end
      end
      @all_fish = temp_hash.clone
    end
  end

  def total_count
    @all_fish.values.sum
  end
end

# initial_states = [3, 4, 3, 1, 2, etc]
file = File.open("puzzle_input.txt").read
initial_states = file.split(',').map { |num| num.to_i }
lanternfish = Lanternfish.new(initial_states)

lanternfish.simulate_days(80)
print "Count after 80: "
puts lanternfish.total_count

lanternfish.simulate_days(256 - 80)
print "Count after 256: "
puts lanternfish.total_count
