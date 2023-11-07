require_relative "piece"
require "byebug"


class Board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def [](position)
    x, y = position
    board[x][y]
  end

  def []=(position, value)
    x, y = position
    board[x][y] = value
  end


  def populate_board
    idx = [1,6]
    board.each_with_index do |row, row_i|
      if idx.include?(row_i)
        row.each_with_index do |col, col_i|
          if row_i == 1 
            row[col_i] = Piece.new(:white, self, [row_i, col_i])
          elsif row_i == 6
            row[col_i] = Piece.new(:black, self, [row_i, col_i])
          end
        end
      end
    end
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

  def move_piece(start_pos, end_pos)
    if !start_pos[0].between?(0,7) || !start_pos[1].between?(0,7) || self[start_pos] == nil 
      raise "No piece on position!"
    end

    if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7) || self[end_pos] != nil
      raise "Invalid position!"
    end
  end

  attr_reader :board

end
