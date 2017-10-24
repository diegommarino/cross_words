
#
# Class that create a grid of chars
#
# @author diegommarino
#
class Grid
  attr_accessor :size, :matrix

  A_CHAR_ASCII = 65
  Z_CHAR_ASCII = 90

  #
  # Initialize the class attributes.
  # @param size [integer]: Size (N) of the grid/matrix N x N
  #
  # @return nil
  def initialize(size)
    @size = size
    @matrix = generate_matrix
  end

  #
  # Print the generated matrix.
  #
  # @return nil
  def print_matrix
    @matrix.each do |m|
      print "#{m}\n"
    end
  end

  private

  #
  # Generate a matrix with random chars from A to Z.
  #
  # @return [2D Array]: The generated matrix
  def generate_matrix
    elements_qty = (@size * @size) - 1

    elements = *(0..(elements_qty)).map { |n| rand(A_CHAR_ASCII..Z_CHAR_ASCII).chr }
    matrix = []
    elements.each_slice(@size) { |x| matrix.push(x) }
    matrix
  end
end
