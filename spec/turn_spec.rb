require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@turn_1).to be_a(Turn)
    end

    it "can have attributes" do
      expect(@turn_1.card).to eq(@card_1)
      expect(@turn_2.card).to eq(@card_2)
      expect(@turn_1.guess).to eq("Juneau")
      expect(@turn_2.guess).to eq("Saturn")
    end
  end

  describe "#correct?" do
    it "checks if the guess is correct" do
      @turn_1.guess
      expect(@turn_1.correct?).to eq(true)
      @turn_2.guess
      expect(@turn_2.correct?).to eq(false)
    end
  end

  describe "#feedback" do
    it "tells whether guess was correct or not" do
      @turn_1.guess
      expect(@turn_1.correct?).to eq(true)
      expect(@turn_1.feedback).to eq("Correct!")
      @turn_2.guess
      expect(@turn_2.correct?).to eq(false)
      expect(@turn_2.feedback).to eq("Incorrect.")
    end
  end
end