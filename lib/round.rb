class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    current_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? && turn.card_category == category
    end
  end

  def percent_correct
    number_correct.to_f / @turns.count * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / turn_count_by_category(category) * 100
  end

  def turn_count_by_category(category)
    @turns.count do |turn|
      turn.card_category == category
    end
  end
end