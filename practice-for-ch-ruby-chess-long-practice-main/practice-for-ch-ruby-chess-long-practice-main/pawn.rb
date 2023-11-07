require_relative "piece"

class Pawn < Piece
  def initialize
    super
    @type = :pawn
    @has_moved? = false
  end

  def moves
    x, y = positions
    possible_moves = []

    if !has_moved?
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


  attr_reader :has_moved?, :positions
  attr_accessor :has_moved?

end
