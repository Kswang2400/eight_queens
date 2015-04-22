
require_relative 'eight_queens'


new_board = Board.new

print "\nPLACE ALL THE QUEENS\n\n"
8.times { new_board.place_piece } 

# print "\nPLACE FIRST PIECE\n\n"
# new_board.place_piece

# print "\n\n\n END OF TURN 1 \n\n\n"

# new_board.show_board_and_spaces_left

# print "\nPLACE SECOND PIECE\n\n"
# new_board.place_piece

# new_board.show_board_and_spaces_left

# print "\nPLACE NEXT 6 PIECES\n\n"
# 6.times { new_board.place_piece } 

# new_board.show_board_and_spaces_left
