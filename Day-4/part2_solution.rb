# Advent of Code Day 4 - Part 2 Solution.

# 'Cheat' Bingo game as a class:

class CheatAtBingo
  def initialize(boards, bingo_numbers, cheat: false)
    @boards = boards
    @bingo_numbers = bingo_numbers
    @bingo = false
    @cheat = cheat
    @winning_board = nil
    @winning_score = 0
    @cheatboard = nil
    @cheat_score = 0

    @boards.each do |board|
      board.each_with_index do |line, index|
        board[index] = line.split.to_h { |num| [num, false] }
      end
    end

    play
    display_results
  end

  private

  def play
    @bingo_numbers.each do |bingo_number|
      next if @bingo

      @boards.each do |board|
        next if @bingo

        board.each do |line|
          line[bingo_number] = true if line[bingo_number] == false
          if bingo?(board)
            @winning_board = board
            @winning_score = calculate_score(board, bingo_number)
          end
        end
      end
    end
  end

  def find_cheat_board
    @bingo_numbers.each do |bingo_number|
      @boards.each do |board|
        next if board[-1] == "BINGO!"

        board.each do |line|
          next if line == "BINGO!" || board[-1] == "BINGO!"

          line[bingo_number] = true if line[bingo_number] == false
          if bingo?(board)
            board << "BINGO!"
            @cheatboard = board
            @cheat_score = calculate_score(board, bingo_number)
          end
        end
      end
    end
  end

  def calculate_score(board, bingo_number)
    score = 0
    board.each do |line|
      next if line == "BINGO!"

      line.each do |key, value|
        score += key.to_i unless value
      end
    end
    score = score * bingo_number.to_i
  end

  def display_results
    if @bingo

      if @cheat
        find_cheat_board
        puts "Cheat board:"
        @cheatboard.each do |line|
          next if line == "BINGO!"

          puts line
        end
        puts "Cheat board score: #{@cheat_score}"
        puts "---------------------"
      end

      puts "Winning board:"
      @winning_board.each do |line|
        next if line == "BINGO!"

        puts line
      end
      puts "BINGO!"
      puts "Winning board score: #{@winning_score}"
    else
      puts "No boards got bingo :("
    end
  end

  def bingo?(board)
    @bingo = false
    # Look at rows and see if bingo
    index = 0
    5.times do
      rows = 0
      board.each do |line|
        next if line == "BINGO!"

        rows += 1 if line.values[index] == true
      end
      @bingo = true if rows == 5
      index += 1
    end

    # Look at columns and see if bingo
    board.each do |line|
      next if line == "BINGO!"

      columns = 0
      line.each_value do |value|
        columns += 1 if value == true
      end
      @bingo = true if columns == 5
    end

    # Return bingo
    @bingo
  end
end



# Launch cheat bingo game!


# Read the txt file for puzzle input
file = File.open("puzzle_input.txt")
lines = file.readlines.map { |line| line.chomp }

# Parse the puzzle input into 'bingo numbers' and 'boards'
bingo_numbers = lines[0].split(',')
boards = lines.drop(1).chunk { |line| line != "" || nil }.map { |_bool, numbers| numbers }

# Initialize 'cheat' bingo game
CheatAtBingo.new(boards, bingo_numbers, cheat: true)
