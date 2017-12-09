class Deck
  DECK = %w[11 10 12 13 14 15 16 17].freeze

  def initialize()
    @deck = DECK.shuffle
  end

  def card
    puts @deck.last
    card = @deck.last
    puts @deck.pop
    card
  end
end
