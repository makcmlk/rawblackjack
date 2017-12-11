class Deck
  DECK = %w[02♥ 02♠ 02♦ 02♣ 03♥ 03♠ 03♦ 03♣ 04♥ 04♠ 04♦ 04♣ 05♥ 05♠ 05♦ 05♣ 06♥ 06♠ 06♦ 06♣ 07♥ 07♠ 07♦ 07♣ 08♥ 08♠ 08♦ 08 09♥ 09♠ 09♦ 09♣ 10♥ 10♠ 10♦ 10♣ V♥ V♠ V♦ V♣ Q♥ Q♠ Q♦ Q♣ K♥ K♠ K♦ K A♥ A♠ A♦ A♣].freeze

  def initialize()
    @deck = DECK.shuffle
  end

  def card
    card = @deck.last
    @deck.pop
    card
  end
end
