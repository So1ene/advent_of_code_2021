# Advent of Code Day 6 - Part 1 Solution.

# (First solution: not scalable because uses too much memory)


# Create lanternfish class
class Lanternfish
    def initialize(initial_state)
        @days = initial_state
    end

    # new_day method that will update the fish and create a baby and return it (or nil)
    def new_day
        # Minus one day until reproduction
        @days -= 1
        if @days == -1
            # If days is -1, spawn a new baby with 8 days, and reset this fish days to 6
            baby = Lanternfish.new(8)
            @days = 6
        end
        # Return baby
        baby
    end
end

# Open puzzle input file and split values into array
file = File.open("puzzle_input.txt").read
initial_states = file.split(',')

# Create a new lanternfish for each value
lanternfish = initial_states.map do |initial_state|
    Lanternfish.new(initial_state.to_i)
end

# Loop through 80 days of simulation

80.times do 
    # Simulate a new day and spawn babies, store in babies variable
    babies = lanternfish.map do |fish|
        fish.new_day
    end
    # babies.compact remove nil values, .concat adds babies to the end of lanternfish array
    lanternfish.concat(babies.compact)
end

# Count how many lanternfish there are left
print "Solution is: "
p lanternfish.count
