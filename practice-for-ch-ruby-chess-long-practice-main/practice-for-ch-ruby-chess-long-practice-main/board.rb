require_relative "piece"; require_relative "pawn"; require_relative "rook"; require_relative "bishop"; require_relative "king"; require_relative "queen"; require_relative "knight"; require_relative "null_piece"
require "byebug"


class Board

  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }
    populate
  end

  # def test_populate(piece, piece2, piece3)
  #   self[[4,4]] = piece.new(:white, self, [4,4])


  #   self[[2, 3]] = piece2.new(:black, self, [2,3])

  #   self[[6, 5]] = piece3.new(:white, self, [6,5])

  # end


  def [](position)
    x, y = position
    board[x][y]
  end

  def []=(position, value)
    x, y = position
    board[x][y] = value
  end


  def populate_pawns
    idx = [1,6]
    board.each_with_index do |row, row_i|
      if idx.include?(row_i)
        row.each_with_index do |col, col_i|
          if row_i == 1 
            row[col_i] = Pawn.new(:white, self, [row_i, col_i])
          elsif row_i == 6
            row[col_i] = Pawn.new(:black, self, [row_i, col_i])
          end
        end
      end
    end
  end


  def populate_not_pawns
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]

    board.each_with_index do |row, row_i|
      if row_i == 0
        row.each_with_index do |col, col_i|
          board[row_i][col_i] = pieces[col_i].new(:white, self, [row_i, col_i])
        end
      elsif row_i == 7
        row.each_with_index do |col, col_i|
          board[row_i][col_i] = pieces[col_i].new(:black, self, [row_i, col_i])
        end
      end
    end
  end

  def populate
    populate_pawns
    populate_not_pawns
  end

  # def populate_board
  #   idx = [0,1,6,7]
  #   board.each_with_index do |row, row_i|
  #     if idx.include?(row_i)
  #       row.each_with_index do |col, col_i|
  #         row[col_i] = Piece.new
  #       end
  #     end
  #   end
  # end


  # def move_piece(color, start_pos, end_pos)
  #   if !start_pos[0].between?(0,7) || !start_pos[1].between?(0,7) || self[start_pos].empty? 
  #     raise "No piece on position!"
  #   end

  #   if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7) || self[end_pos].empty?
  #     raise "Invalid position!"
  #   end
  # end

  def valid_position?(end_pos)
    end_pos[0].between?(0,7) && end_pos[1].between?(0,7)
  end

  attr_reader :board

end







