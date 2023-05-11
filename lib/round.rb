class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
  @deck = deck
  @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    last_card = @deck.cards.shift
    @turns.last
  end
  # The take_turn method is the crux of this problem. The take_turn method takes a string representing the guess. It should create a new Turn object with the appropriate guess and Card. It should store this new Turn, as well as return it from the take_turn method. Also, when the take_turn method is called, the Round should move on to the next card in the deck.

  def number_correct
    @turns.select do |turn|
      turn.correct?
    end.count
  end

  def count
    @turns.count
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.card.category == category && turn.correct?
    end
  end

  def percent_correct
    (number_correct / count.to_f) * 100
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / total_by_category(category)).to_f * 100
  end

  def total_by_category(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end
end