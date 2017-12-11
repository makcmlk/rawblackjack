class Player
  attr_reader :name, :bank

  def initialize(name = 'Bot', bank = 100)
    @name = name
    @cards = []
    @bank = bank
  end

  def cards
    @cards.to_s
  end

  def points
  end

  def new_card(card)
    @cards.push(card)
  end

  def bet(summ)
    return false unless summ > @bank
    @bank -= summ
  end

  def profit(summ)
    @bank += summ
  end
end
