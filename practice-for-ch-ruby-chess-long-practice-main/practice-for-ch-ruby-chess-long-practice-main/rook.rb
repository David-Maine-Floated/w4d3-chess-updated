require_relative 'slideable'
require_relative 'piece'

require 'byebug'
class Rook < Piece
  include Slideable

  

  def symbol
    "♜".colorize(color)
  end



  def move_dirs
    # return the directions in which a rook can move
    horizontal_and_vertical_dirs

  end
end