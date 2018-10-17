# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,4,8], # \ diagonal
  [2,4,6], # / diagonal
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8] # right column
]

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    if win_array.all?{|board_position| board[board_position] == "X"}
      return win_array
    elsif win_array.all?{|board_position| board[board_position] == "O"}
      return win_array
    end
  end
  if board.all?{|space| position_taken?(board, space.to_i)} || board.none?{|space| position_taken?(board, space.to_i)}
    return false
  end
end

def full?(board)
  board.any?{|space| board[space.to_i] == " " || board[space.to_i] == nil}
end
