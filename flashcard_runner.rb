require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Joey's favorite food?", "Salmon", :"Baby Facts")
card_3 = Card.new("What character attribute refers to 10 + their wisdom modifer?", "Passive Perception", :"D&D")
card_4 = Card.new("What color is Mario's hat?", "Red", :"Video Games")
card_5 = Card.new("Who is Master Chief's A.I.?", "Cortana", :"Video Games")
cards = [card_1, card_2, card_3, card_4, card_5]
deck = Deck.new(cards)
round = Round.new(deck)

round.start