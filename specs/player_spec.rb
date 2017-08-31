require_relative 'spec_helper.rb'

describe "The Player class" do

  before do
    @player = Scrabble::Player.new('Peter')
    # @class = Scrabble::Player
  end

  describe "Initialising Player" do

    it "Player is a class of the Scrabble" do
      @player.must_be_instance_of Scrabble::Player
    end

    it "Player is a class" do
      @player.class.must_be_kind_of Class
    end

    it "hsa a readable name variable" do
      @player.name.must_equal "Peter"
    end
  end

  describe "the play method" do

    it "Responds to the play method" do
      @player.must_respond_to :play
    end

    it "stores the words that you input in the play method inside @plays" do
      @player.play("word")
      @player.plays.must_equal ["WORD"]
    end

    it "increases the total_score as you add new words" do
      score1 = @player.play("word")
      score2 = @player.play("hello")
      ourscore = score1 + score2
      @player.total_score.must_equal ourscore
    end

    it "Returns false if the player has already won" do
      @player.play("zzebras")
      @player.play("azaleas")
      @player.play("hello").must_equal false
    end
  end

  describe "Class attributes" do
    it "@plays is an array" do
      @player.play("word")
      @player.play("hello")
      @player.play("apple")
      @player.play("zzzzzzz")
      @player.plays.must_be_kind_of Array
    end
    it "@plays must contains all of a player words" do
      @player.play("word")
      @player.play("hello")
      @player.play("apple")
      @player.play("zzzzzzz")
      @player.plays.must_include "WORD"
      @player.plays.must_include "HELLO"
      @player.plays.must_include "APPLE"
      @player.plays.must_include "ZZZZZZZ"
    end
  end



  describe "The highest_scoring_word method" do

    it "Returns the highest scoring word for the player" do
      @player.play("word")
      @player.play("hello")
      @player.play("apple")
      @player.play("zzzzzzz")
      @player.highest_scoring_word.must_equal "ZZZZZZZ"
    end

    it "Returns  a string" do
      @player.play("word")
      @player.play("hello")
      @player.play("apple")
      @player.play("zzzzzzz")
      @player.highest_scoring_word.class.must_equal String
    end
  end

  describe "The highest_word_score method" do

    it "Returns the highest scoring word score" do
      @player.play("word")
      @player.play("hello")
      @player.play("apple")
      @player.play("zzzzzzz")
      @player.highest_word_score.must_equal 120
    end
  end
end