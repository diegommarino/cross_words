# Load the path of the project
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Models/grid'
require 'Models/word_searcher'

words_dict = []
file = 'dict.txt'

# Read the given dict.txt file.
File.readlines(file).each do |line|
  words_dict.push(line.split(' ').first)
end

# Let user input the size of the char matrix.
puts "Set the size of the chars matrix (N x N)."
size = gets

# Create the chars matrix.
grid = Grid.new(size.to_i)

# Create the search object passing the chars matrix and the words dict array.
searcher = WordSearcher.new(grid.matrix, words_dict)

# Print the matrix.
grid.print_matrix

# Print the found words.
print "#{searcher.found_words}\n"
