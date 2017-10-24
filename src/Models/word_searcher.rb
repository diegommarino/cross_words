#
# Search words in a Matrix N x N based on a dict.
#
# @author diegommarino
#
class WordSearcher
  attr_accessor :letters_grid, :words_dict, :found_words

  #
  # Initialize the class attributes.
  # @param letters_grid [2D Array]: Matrix of letters.
  # @param words_dict [Array]: Dictionary with words that should be
  # found on letters_grid.
  #
  # @return nil
  def initialize(letters_grid, words_dict)
    @letters_grid = letters_grid
    @words_dict = words_dict.compact
    @found_words = []
    find_words
  end

  #
  # Find the @words_dict words in the @letters_grid and initialize
  # the @found_words attribute.
  #
  # @return nil
  def find_words
    research_strings = []
    research_strings += left_to_right_strings
    research_strings += right_to_left_strings
    research_strings += top_to_bottom_strings
    research_strings += bottom_to_top_strings
    research_strings += diagonal_left_to_right_strings
    research_strings += diagonal_right_to_left_strings
    check_words_dict(research_strings)
  end

  #
  # Horizontal left to right strings in @letters_grid
  #
  # @return [2D Array]: The found words.
  def left_to_right_strings
    require 'pry'
    research_strings = []
    for i in 0..(@letters_grid.size - 1)
      research_strings.push(@letters_grid[i].join())
    end
    # binding.pry
    research_strings.uniq!
    research_strings
  end

  #
  # Horizontal right to left  strings in @letters_grid
  #
  # @return [2D Array]: The found words.
  def right_to_left_strings
    research_strings = []
    for i in 0..(@letters_grid.size - 1)
      research_strings.push(@letters_grid[i].reverse.join())
    end
    research_strings.uniq!
    research_strings
  end

  #
  # Vertical top to bottom strings in @letters_grid
  #
  # @return [2D Array]: The found words.
  def top_to_bottom_strings
    research_strings = []
    for i in 0..(@letters_grid.size - 1)
      column_string = *(0..(@letters_grid.size - 1)).
        map { |j| @letters_grid[j][i]}.join()
      research_strings.push(column_string)
    end
    research_strings.uniq!
    research_strings
  end

  #
  # Vertical bottom to top strings in @letters_grid
  #
  # @return [2D Array]: The found words
  def bottom_to_top_strings
    research_strings = []
    for i in 0..(@letters_grid.size - 1)
      column_string = *(0..(@letters_grid.size - 1)).
        map { |j| @letters_grid[j][i]}.reverse.join()
      research_strings.push(column_string)
    end
    research_strings.uniq!
    research_strings
  end

  #
  # Diagonal left to right strings in @letters_grid
  #
  # @return [2D Array]: The found words
  def diagonal_left_to_right_strings
    research_strings = []

    for i in 0..(@letters_grid.size - 1)
      upper_diagonal = []
      lower_diagonal = []

      for j in 0..(@letters_grid.size - 1)
        begin
          lower_diagonal.push(@letters_grid[i+j][j])
          upper_diagonal.push(@letters_grid[j][i+j])
        rescue Exception
        end
      end

      research_strings.push(lower_diagonal.join())
      research_strings.push(upper_diagonal.join())
    end
    research_strings.uniq!
    research_strings
  end

  #
  # Diagonal right to left strings in @letters_grid
  #
  # @return [2D Array]: The found words
  def diagonal_right_to_left_strings
    size = @letters_grid.size - 1
    research_strings = []

    for i in (0..(size))
      upper_diagonal = []
      lower_diagonal = []

      for j in (0..(size))
        begin
          lower_diagonal.push(@letters_grid[i+j][size - j])
          upper_diagonal.push(@letters_grid[j][size - i - j])
        rescue Exception
        end
      end

      research_strings.push(lower_diagonal.join())
      research_strings.push(upper_diagonal.join())
    end
    research_strings.uniq!
    research_strings
  end

  def check_words_dict(research_strings)
    @words_dict.each do |dict_word|
      research_strings.each do |research_string|
        @found_words.push(dict_word) if research_string.include?(dict_word)
      end
    end
    @found_words.sort!.uniq!
  end
end
