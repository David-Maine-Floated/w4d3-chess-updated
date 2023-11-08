class Piece
  attr_reader :board, :position, :color
  def initialize(color, board, pos)
    @color = color
    @board = board
    @position = pos
  end

  def empty?
    false
  end
  












end