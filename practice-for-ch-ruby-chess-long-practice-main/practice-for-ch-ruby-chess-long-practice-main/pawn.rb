require_relative "piece"
# still trying to make pawn#moves work. for fun, ask about class display method so we dont have to see the entire board when we want to look at a pawn.

class Pawn < Piece
  def initialize(color, board, pos)
    super
    @type = :pawn
    @has_moved = false
  end

  def display
    board.each do |row|
      

    end
  end

  def moves
    x, y = positions
    possible_moves = []

    if !has_moved
      possible_moves << [x+2, y]
    end

    possible_move_pos = [x+1, y]

    if board[possible_move_pos] == nil
      possible_moves << possible_move_pos
    end

    possible_attack_pos_1 = [x+1, y+1]

    space = board[possible_attack_pos_1]

    if !space.nil? && space.color != self.color
      possible_moves << possible_attack_pos_1
    end

    return possible_moves
  end


  attr_reader :positions
  attr_accessor :has_moved

end
