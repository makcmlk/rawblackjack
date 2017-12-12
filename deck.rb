class Deck
  DECK = Hash['02♥', 2, '02♠', 2, '02♦', 2, '02♣', 2,
              '03♥', 3, '03♠', 3, '03♦', 3, '03♣', 3,
              '04♥', 4, '04♠', 4, '04♦', 4, '04♣', 4,
              '05♥', 5, '05♠', 5, '05♦', 5, '05♣', 5,
              '06♥', 6, '06♠', 6, '06♦', 6, '06♣', 6,
              '07♥', 7, '07♠', 7, '07♦', 7, '07♣', 7,
              '08♥', 8, '08♠', 8, '08♦', 8, '08♣', 8,
              '09♥', 9, '09♠', 9, '09♦', 9, '09♣', 9,
              '10♥', 10, '10♠', 10, '10♦', 10, '10♣', 10,
              'V♥', 10, 'V♠', 10, 'V♦', 10, 'V♣', 10,
              'Q♥', 10, 'Q♠', 10, 'Q♦', 10, 'Q♣', 10,
              'K♥', 10, 'K♠', 10, 'K♦', 10, 'K♣', 10,
              'A♥', 10, 'A♠', 10, 'A♦', 10, 'A♣', 10]

  def self.points_of(cards)
    summ = 0
    cards.each do |card|
      if card.include?('A')
        summ += 11 if (21 - summ + 11).abs < (21 - summ + 1).abs && summ + 11 < 21
        summ += 1 if (21 - summ + 11).abs > (21 - summ + 1).abs && summ + 1 <= 21
      else
        summ += DECK[card]
      end
    end
    summ
  end

  def initialize()
    @cards = DECK.keys.shuffle
  end

  def card
    card = @cards.last
    @cards.pop
    card
  end
end
