require "singleton"
require_relative "piece"


class NullPiece
  include Singleton

  def initialize

  end

  def symbol
    "__"
  end


  def empty?
    true
  end

end