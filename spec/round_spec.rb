require 'spec_helper'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    # @new_turn = @round.take_turn("Juneau")

  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@round).to be_a(Round)
    end

    it 'can have attributes' do
      expect(@round.deck).to eq(@deck)
      expect(@round.turns).to eq([])
    end
  end

  describe '#current_card' do
    it 'returns the current card' do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @deck = Deck.new([@card_1, @card_2, @card_3])
      @round = Round.new(@deck)
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take_turn(guess)' do
    it 'has a take turn method' do
      @new_turn = @round.take_turn("Juneau")
      expect(@new_turn.class).to eq(Turn)
      expect(@new_turn.correct?).to eq(true)
      expect(@round.turns).to eq([@new_turn])
      expect(@round.number_correct).to eq(1)
      expect(@round.current_card).to eq(@card_2)
      expect(@round.current_card).to be_a(Card)

      @round.take_turn("Venus")
      expect(@round.turns.count).to eq(2)
      expect(@round.turns.last.feedback).to eq("Incorrect.")
      expect(@round.number_correct).to eq(1)
    end
  end

  describe '#number_correct_by_category' do
    it 'counts correct number of guesses by category' do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")
      expect(@round.number_correct_by_category(:Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
  end

  describe '#percent_correct' do
    it 'returns correct percentage' do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")
      expect(@round.percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category' do
    it 'returns correct percentage by category' do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")
      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
      
      expect(@round.total_by_category(:Geography)).to eq(1)
      expect(@round.current_card).to eq(@card_3)
    end
  end
end