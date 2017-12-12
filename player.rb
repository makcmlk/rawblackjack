class Player
  attr_reader :name, :bank

  def initialize(name = 'Bot', bank = 100)
    @name = name
    @cards = []
    @bank = bank
  end

  def cards
    @cards
  end

  def new_card(card)
    @cards.push(card)
  end

  def bet(summ)
    @cards = []
    @bank -= summ
  end

  def profit(summ)
    @bank += summ
  end
end
