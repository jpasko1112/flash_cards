require './spec/spec_helper'
@card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
@card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", "Pop Culture")
@cards = [@card_1, @card_2, @card_3, @card_4]
@deck = Deck.new(@cards)
@round = Round.new(@deck)


puts "Welcome! You're playing with #{@deck.count} cards.\n\n"

puts"-------------------------------------------------"

puts "This is card number #{@round.turns.count + 1} out of #{@deck.count}.
Question: #{@round.current_card.question}\n\n"

puts "Enter your answer below."

user_guess_1 = gets.chomp 