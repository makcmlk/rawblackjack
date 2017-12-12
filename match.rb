require_relative 'Player'
require_relative 'Deck'

# asdsd
class Match
  def initialize(name1, name2, summ)
    @player = Player.new(name1)
    @bot = Player.new(name2)
    @bet_summ = summ
  end

  def round_start
    @deck = Deck.new
    player_bet
    @player.new_card(@deck.card)
    @bot.new_card(@deck.card)
    @player.new_card(@deck.card)
    @bot.new_card(@deck.card)
  end

  def card_to_player
    @player.new_card(@deck.card)
  end

  def bot_turn
    @bot.new_card(@deck.card) if Deck.points_of(@bot.cards) >= 18
  end

  def result
    player_points = Deck.points_of(@player.cards)
    bot_points = Deck.points_of(@bot.cards)
    if (player_points - 21).abs < (bot_points - 21).abs
      @player.profit(@bet_summ * 2)
      return [player_points, bot_points, @player.name]
    elsif (player_points - 21).abs > (bot_points - 21).abs
      @bot.profit(@bet_summ * 2)
      return [player_points, bot_points, @bot.name]
    else
      @player.profit(@bet_summ)
      @bot.profit(@bet_summ)
      [player_points, bot_points, nil]
    end
  end

  def player_bet
    puts @player.bank
    @player.bet(@bet_summ)
    puts @player.bank
    @bot.bet(@bet_summ)
  end

  def bank
    @player.bank
  end

  def player_name
    @player.name
  end

  def player_points
    Deck.points_of(@player.cards)
  end

  def player_cards
    @player.cards
  end

  def cards_bot
    @bot.cards
  end
end
