class Round
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards[@turns.length]
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
    number_correct.to_f / @turns.length * 100
  end

  def percent_correct_by_category(category)
    number_correct_by_category(category).to_f / turn_count_by_category(category) * 100
  end

  def turn_count_by_category(category)
    @turns.count do |turn|
      turn.card_category == category
    end
  end

  def start
    system 'clear'
    puts "Welcome! You're playing with #{@deck.card_count} cards."
    puts "-------------------------------------------------"

    @deck.cards.each_with_index do |card, index|
      puts "This is card number #{index+1} out of #{@deck.card_count}."
      puts "Question: #{card.question}"
      input = gets.chomp
      turn = take_turn(input)
      puts turn.feedback
      puts "-------------------------------------------------"
    end

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{@turns.length} for a total score of #{percent_correct}%."
    @deck.categories.each do |category|
      puts "#{category} - #{percent_correct_by_category(category)}% correct"
    end
  end
end