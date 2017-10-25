require 'spec_helper'

RSpec.describe WordSearcher do
  let(:grid) { x = Grid.new 2; x.matrix = [['A', 'B'], ['C', 'D']]; x }
  let(:words_dict_all) { ['AB', 'CD', 'BA', 'DC', 'AD', 'BC', 'A', 'B', 'C', 'D'] }
  let(:words_dict_some) { ['BA', 'BC', 'FF'] }
  let(:word_searcher_all) { WordSearcher.new(grid.matrix, words_dict_all) }
  let(:word_searcher_some) { WordSearcher.new(grid.matrix, words_dict_some) }

  describe "#new" do
    it "Take the parameters and return the WordSearcher object" do
      expect(word_searcher_all).to be_instance_of WordSearcher
    end
  end

  describe "Methods" do
    describe "#left_to_right_strings" do
      it { expect(word_searcher_all.left_to_right_strings).to contain_exactly('AB','CD') }
    end

    describe "#right_to_left_strings" do
      it { expect(word_searcher_all.right_to_left_strings).to contain_exactly('BA','DC') }
    end

    describe "#top_to_bottom_strings" do
      it { expect(word_searcher_all.top_to_bottom_strings).to contain_exactly('AC','BD') }
    end

    describe "#bottom_to_top_strings" do
      it { expect(word_searcher_all.bottom_to_top_strings).to contain_exactly('CA','DB') }
    end

    describe "#diagonal_left_to_right_strings" do
      it { expect(word_searcher_all.diagonal_left_to_right_strings).to contain_exactly('AD', 'B', 'C') }
    end

    describe "#diagonal_right_to_left_strings" do
      it { expect(word_searcher_all.diagonal_right_to_left_strings).to contain_exactly('BC', 'A', 'D') }
    end

    # private

    describe "#find_words and #check_words_dict" do
      context "@found_words attribute" do
        it "should have all dictionary words" do
          expect(word_searcher_all.found_words).to eq words_dict_all.sort
        end

        it "should have some dictionary words" do
          expect(word_searcher_some.found_words).to contain_exactly('BA', 'BC')
          expect(word_searcher_some.found_words).to_not include('FF')
        end
      end
    end
  end
end
