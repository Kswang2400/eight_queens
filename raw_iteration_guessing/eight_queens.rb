
class Board
  attr_accessor :board, :spaces_left

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @spaces_left = []
    (0..7).each do |i|
      (0..7).each do |j|
        spaces_left << [i, j]
      end
    end
  end

  # def [](row, col)
  #   @grid[row][col]
  # end

  def show_board_and_spaces_left
    print "\n"
    8.times do |n|
      p board[n]
    end
    print "\n"
    p self.spaces_left
    print "\n"
  end


  def place_piece

    # next_pos = spaces_left[0]
    # p "next_pos = #{next_pos}"
    # p next_pos.class
    # board[*next_pos] = "Q"

    if spaces_left.count == 64
      position_queen = [0, 1]
    else
      position_queen = spaces_left[2 % spaces_left.count]
    end

    board[position_queen[0]][position_queen[1]] = "   Q  "
    spaces_left.delete(position_queen)

    board = self.remove_row(position_queen)
    board = self.remove_column(position_queen)
    board = self.remove_neg_slope_diagonal(position_queen)
    board = self.remove_pos_slope_diagonal(position_queen)

    show_board_and_spaces_left

    self.spaces_left = self.clean_spaces_left_list
  end

  def remove_row(position_array)
    row = position_array[0]
    board[row].each_with_index do |space_in_row, index|
      if space_in_row.nil?
        board[row][index] = :blocked
      end
    end

    board
  end

  def remove_column(position_array)
    column = position_array[1]
    board.each_with_index do |entire_row, index|
      if entire_row[column].nil?
        entire_row[column] = :blocked
      end
    end

    board
  end

  def remove_neg_slope_diagonal(position_array)
    list_of_invalid = []
    (1..7).each do |n|
      bad_space = [position_array[0] + n, position_array[1] + n]

      if bad_space[0].between?(0,7) && bad_space[1].between?(0,7)
        list_of_invalid << bad_space
      end
    end

    list_of_invalid.each do |position|
      board[position[0]][position[1]] = :blocked
    end

    board
  end

  def remove_pos_slope_diagonal(position_array)
    list_of_invalid = []
    (1..7).each do |n|
      bad_space = [position_array[0] + n, position_array[1] - n]

      if bad_space[0].between?(0,7) && bad_space[1].between?(0,7)
        list_of_invalid << bad_space
      end
    end

    list_of_invalid.each do |position|
      board[position[0]][position[1]] = :blocked
    end

    board
  end

  def clean_spaces_left_list
    temp_spaces_left = []
    spaces_left.each do |position|
      if board[position[0]][position[1]] != :blocked
        temp_spaces_left << position
      end
    end

    temp_spaces_left
  end
end

