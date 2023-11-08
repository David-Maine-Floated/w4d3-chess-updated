module Stepable

  # collect all the moves that a stepable piece can move to
  KNIGHT_MOVES = [
    [-1, -2],
    [-2, -1],
    [-2, +1],
    [-1, +2],
    [+1, +2],
    [+2, +1],
    [+2, -1],
    [+1, -2]
  ].freeze


  KING_MOVES = [
    [-1, 0],
    [-1, +1],
    [0, +1],
    [+1, +1],
    [+1, 0],
    [+1, -1],
    [0, -1],
    [-1, -1]
  ].freeze


  def knight_moves
    KNIGHT_MOVES
  end

  def king_moves
    KING_MOVES
  end


  def moves
    moves = []
    cx, cy = self.position

    move_dirs.each do |dx_dy|
      dx, dy = dx_dy
      new_pos = [cx + dx, cy + dy]

      if board.valid_position?(new_pos) && (board[new_pos].empty? || board[new_pos].color != self.color )
        moves << new_pos
      end

    end

      moves
  end

end