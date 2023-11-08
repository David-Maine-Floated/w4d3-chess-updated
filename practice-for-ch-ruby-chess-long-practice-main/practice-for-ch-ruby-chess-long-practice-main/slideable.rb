module Slideable

  #  HORIZONTAL_AND_VERTICAL_DIRS stores an array of horizontal and vertical directions
    # what a piece moves in a given direction it's row and/or col should increment by some value (change by some value)
    # ex: A piece starts at pos [3, 3] and it moves horizontally to the left 
      # it's position changes to [3, 2]
      # the row increased by 0 and col increased by -1
  HORIZONTAL_AND_VERTICAL_DIRS = [
    [0, -1], # left
    [0, +1], # right
    [-1, 0], # up (vertical)
    [+1, 0]  # down (vertical)
  ].freeze

  #  DIAGONAL_DIRS stores an array of diagonal directions
  DIAGONAL_DIRS = [
    [-1, -1], # left + up
    [-1, +1], # right + up
    [+1, -1], # left + down
    [+1, +1]  # right + down
  ].freeze

  def horizontal_and_vertical_dirs
    HORIZONTAL_AND_VERTICAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS 
  end

  def moves
    possible_moves = []
    
    move_dirs.each do |dx_dy|
      current_pos = self.position
      dx, dy = dx_dy
      possible_moves += grow_unblocked_moves_in_dir(current_pos, dx, dy)
    end

    return possible_moves
  end



  def grow_unblocked_moves_in_dir(current_pos, dx, dy)
    moves = []

    current_pos = [current_pos[0] + dx, current_pos[1] + dy]
    while board.valid_position?(current_pos)

      if board[current_pos].empty?
        moves << current_pos
      elsif board[current_pos].color == self.color
        break
      elsif board[current_pos].color != self.color
        moves << current_pos
        break
      end

      current_pos = [current_pos[0] + dx, current_pos[1] + dy]
    end

    return moves
  end
end