require_relative 'Player'
require_relative 'Deck'

# asdsd
class Match
  def initialize(player_name1, player_name2)
    @player = Player.new(player_name1)
    @bot = Player.new(player_name2)
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

  def player_cards
    @player.cards
  end

  def bot_cards
  end
end
