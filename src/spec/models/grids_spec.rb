require 'spec_helper'

RSpec.describe Grid do
  let(:grid) { Grid.new 3 }

  describe "Constants" do
    it "Should have A_CHAR_ASCII = 65" do
      expect(Grid::A_CHAR_ASCII).to eq 65
    end

    it "Should have Z_CHAR_ASCII = 90" do
      expect(Grid::Z_CHAR_ASCII).to eq 90
    end
  end

  describe "#new" do
    it "Takes the parameters and returns a Grid object" do
      expect(grid).to be_an_instance_of Grid
    end
  end

  describe "Methods" do
    describe "#print_matrix" do
      it "Should print the generated matrix" do
        matrix = [['A', 'B', 'C'],['D', 'E', 'F'],['G', 'H', 'I']]
        grid = Grid.new 3
        grid.matrix = matrix
        expect(grid.print_matrix).to eq matrix.each { |x| "#{x}\n" }
      end
    end

    # Private methods
    describe "#generate_matrix" do
      it "Should build a N x N Array for matrix attribute" do
        expect(grid.matrix.size).to eq 3
        expect(grid.matrix[0].size).to eq 3
      end

      it "Should have only upper case letters" do
        ascii_matrix = grid.matrix.flatten.map{ |n| n.ord }
        expect(ascii_matrix.min).to be >= Grid::A_CHAR_ASCII
        expect(ascii_matrix.max).to be <= Grid::Z_CHAR_ASCII
      end
    end
  end
end
