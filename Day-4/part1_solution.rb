# Advent of Code Day 4 - Part 1 Solution.

# Bingo game as a class:

class Bingo
  def initialize(boards, bingo_numbers)
    @boards = boards
    @bingo_numbers = bingo_numbers
    @bingo = false
    @score = 0

    @boards.each do |board|
      board.each_with_index do |line, index|
        board[index] = line.split.to_h { |num| [num, false] }
      end
    end

    play

    puts "---------------------"
    puts @bingo ? "BINGO!" : "No boards got bingo :("
    puts "score: #{@score}"
  end

  private

  def bingo?(board)
    # Look at rows and see if bingo
    index = 0
    5.times do
      rows = 0
      board.each do |line|
        rows += 1 if line.values[index] == true
      end
      @bingo = true if rows == 5
      index += 1
    end

    # Look at columns and see if bingo
    board.each do |line|
      columns = 0
      line.each_value do |value|
        columns += 1 if value == true
      end
      @bingo = true if columns == 5
    end

    # Return bingo
    @bingo
  end

  def play
    @bingo_numbers.each do |bingo_number|
      next if @bingo

      @boards.each do |board|
        next if @bingo

        board.each do |line|
          line[bingo_number] = true if line[bingo_number] == false
          calculate_score(board, bingo_number) if bingo?(board)
        end
      end
    end
  end

  def calculate_score(winning_board, bingo_number)
    winning_board.each do |line|
      puts line
      line.each do |key, value|
        @score += key.to_i unless value
      end
    end
    @score = @score * bingo_number.to_i
  end
end



# Launch bingo game!


# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp }

# Parse the puzzle input into 'bingo numbers' and 'boards'
bingo_numbers = lines[0].split(',')
boards = lines.drop(1).chunk { |line| line != "" || nil }.map { |_bool, numbers| numbers }

# Initialize bingo game
Bingo.new(boards, bingo_numbers)
