require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  let(:card) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:turn) { Turn.new("Juneau", card)}
  it 'exists' do
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    expect(turn.guess).to eq("Juneau")
  end

  it 'can check if a guess is correct' do
    expect(turn.correct?).to be true
  end
end