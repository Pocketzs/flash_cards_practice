require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  let(:card_1) { Card.new("What is the capital of Alaska?",
                          "Juneau",
                           :Geography) }
  let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                          "Mars",
                           :STEM) }
  let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                          "North north west",
                           :STEM) }
  let(:cards) { [card_1, card_2, card_3] }
  let(:deck) { Deck.new(cards)}

  context "when a deck is created with cards" do
    it 'exists' do
      expect(deck).to be_instance_of(Deck)
    end

    it 'has cards' do
      expect(deck.cards).to eq([card_1, card_2, card_3])
    end

    it 'has categories' do
      expect(deck.categories).to eq([:Geography, :STEM])
    end
  end

  context "when counting cards" do
    it 'returns the number of cards in the deck' do
      expect(deck.card_count).to eq(3)
    end
  end

  context 'when retrieving cards by category' do
    it 'can get cards by category' do
      expect(deck.cards_in_category(:STEM)).to eq([card_2, card_3])
    end

    it 'can get cards by a different category' do
      expect(deck.cards_in_category(:Geography)).to eq([card_1])
    end

    it 'returns an empty array for category with no cards'  do
      expect(deck.cards_in_category("Pop Culture")).to eq([])
    end
  end
end