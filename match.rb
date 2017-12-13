require_relative 'Player'
require_relative 'Deck'

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
    if player_points == bot_points
      @player.profit(@bet_summ)
      @bot.profit(@bet_summ)
      return nil
    end
    bot_lose = bot_points > 21 && player_points <= 21
    player_won = bot_points < 21 && player_points <= 21 && (bot_points - 21).abs > (player_points - 21).abs
    puts "bot_lose #{bot_lose}"
    puts "player_won #{player_won}"    
    if bot_lose || player_won
      @player.profit(@bet_summ * 2)
      return @player.name
    end
    player_lose = bot_points <= 21 && player_points > 21
    bot_won = bot_points <= 21 && player_points < 21 && (bot_points - 21).abs < (player_points - 21).abs
    puts "player_lose #{player_lose}"
    puts "bot_won #{bot_won}"    
    if player_lose || bot_won
      @bot.profit(@bet_summ * 2)
      return @bot.name
    end
  end

  def player_bet
    @player.bet(@bet_summ)
    @bot.bet(@bet_summ)
  end

  def player
    { 'name' => @player.name,
      'cards' => @player.cards,
      'bank' => @player.bank,
      'points' => Deck.points_of(@player.cards) }
  end

  def bot
    { 'name' => @bot.name,
      'cards' => @bot.cards,
      'points' => Deck.points_of(@bot.cards) }
  end
end
