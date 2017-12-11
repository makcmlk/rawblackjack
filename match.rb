require_relative 'Player'
require_relative 'Deck'

# asdsd
class Match
  def initialize(name1, name2)
    @player = Player.new(name1)
    @bot = Player.new(name2)
  end

  def round_start
    @deck = Deck.new
    @player.new_card(@deck.card)
    @player.new_card(@deck.card)
    @bot.new_card(@deck.card)
    @bot.new_card(@deck.card)
    player_bet(10)
  end

  def card_to_player
    @player.new_card(@deck.card)
    @bet.new_card(@deck.card)
  end

  def bot_turn
    @bot.new_card(@deck.card) if @bot.points > 15
  end

  def result
    [@player.points, @bot.points, true]
  end

  def player_bet(summ)
    @player.bet(summ)
    @bot.bet(summ)
  end

  def bank
    @player.bank
  end

  def player_name
    @player.name
  end

  def cards
    @player.cards
  end

  def cards_of_bot
    @bot.cards
  end
end
