require_relative "piece"
# still trying to make pawn#moves work. for fun, ask about class display method so we dont have to see the entire 
# board when we want to look at a pawn.

class Pawn < Piece
  def initialize(color, board, pos)
    super

    @has_moved = false
  end

  def symbol
    "♟︎".colorize(color)
  end

  def moves
    x, y = position
    possible_moves = []

    if !has_moved
      if self.color == :white
        possible_moves << [x+2, y]
      else
        possible_moves << [x-2, y]
      end
    end

    possible_move_pos = (self.color == :white) ? [x+1, y] : [x-1, y]

    if board[possible_move_pos].empty?
      possible_moves << possible_move_pos
    end

    if self.color == :white
      possible_attack_positions = [[x+1, y+1], [x+1, y-1]]
    else
      possible_attack_positions = [[x-1, y-1], [x-1, y+1]]
    end

    possible_attack_positions.each do |attack_pos|
      space = board[attack_pos]

      if space.empty? && space.color != self.color
        possible_moves << possible_attack_positions
      end

    end

    return possible_moves
  end

  def inspect
    "#{self.name}, #{color}, #{position}"
  end




  attr_accessor :has_moved

end
