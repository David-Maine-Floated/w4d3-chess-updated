require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable

  def symbol
    "♞".colorize(color)
  end


  def move_dirs
    knight_moves
  end

end