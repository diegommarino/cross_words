# Cross Words Finder
A simple project made to find words (up-down, down-up, left-right, right-left, diagonal, anti-diagonal) from a dict in a random ganerated matrix of characters. To run it you need ruby 2.2+.
To run it:
```console
$ git clone https://github.com/diegommarino/cross_words.git
$ cd cross_words
$ gem install rspec factory_girl shoulda-matchers
$ ruby src/mains.rb
```
The example dict is the file dict.txt. If you want your own words you can empty the file and add one word per line. The code models were tested with RSpec and all the files were documented using the yard syntax.
