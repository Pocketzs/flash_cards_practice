require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
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
  let(:round) { Round.new(deck) }

  context "when a round is created with a deck" do
    it 'exists' do
      expect(round).to be_instance_of(Round)
    end

    it 'has a deck' do
      expect(round.deck).to eq(deck)
    end

    it 'starts with no turns' do
      expect(round.turns).to eq([])
    end

    it 'starts with no correct answers' do
      expect(round.number_correct).to eq(0)
    end

    it 'starts with the first card in the deck' do
      expect(round.current_card).to eq(card_1)
    end
  end

  context "when a turn is taken" do 
    let(:new_turn) { round.take_turn("Juneau") }

    it 'creates a turn' do
      expect(new_turn).to be_instance_of(Turn)
    end

    it 'checks if the guess is correct' do
      expect(new_turn.correct?).to be true
    end

    it "adds the turn to the round's turns" do
      expect(round.turns).to eq([new_turn])
    end

    it 'increments the number correct is guessed correctly' do
      expect { new_turn }.to change { round.number_correct }.by(1)
    end

    it 'moves to the next card' do
      expect { new_turn }.to change { round.current_card }.from(card_1).to(card_2)
    end
  end

  context 'when multiple turns are taken' do 
    let!(:turn_1) { round.take_turn("Juneau") }
    let!(:turn_2) { round.take_turn("Venus") }

    it "adds both turns to the round's turns" do
      expect(round.turns.count).to eq(2)
    end

    it "check for correctness" do
      expect(round.turns.last.feedback).to eq("Incorrect.")
    end

    it "counts the number correct" do
      expect(round.number_correct).to eq(1)
    end

    it 'can check number correct by category' do
      expect(round.number_correct_by_category(:Geography)).to eq(1)
    end

    it 'can check number correct by a different category' do
      expect(round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'calculates the percent correct' do 
      expect(round.percent_correct).to eq(50.0)
    end

    it 'calculates percent correct by category' do
      expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
    end

    it 'moves to the next card' do 
      expect(round.current_card).to eq(card_3)
    end
  end
end