require_relative 'Match'
require_relative 'Player'

class Game
  def self.run
    game = Game.new
    loop do
      begin
        game.show_menu
        input = gets.chomp.to_i
        case input
        when 1
          game.match_start
        when 2
          puts 'Bye!'
          break
        end
      end
    end
  end

  def show_menu
    puts 'Welcome to Black-Jack game! select what to do:'
    puts '1. Start a new game'
    puts '2. Exit'
  end

  def match_start
    puts 'Enter your name: '
    input = gets.chomp.to_s
    @match = Match.new(input, 'Robot')
    round
  end

  def round
    @match.round_start
    show_cards
    puts 'What to do? 1: SKIP, 2: GET A CARD, 3: OPEN!'
    input = gets.chomp.to_i
    case input
    when 1
      @match.bot_turn
      result
    when 2
      @match.card_to_player
      @match.bot_turn
      result
    when 3
      @match.open_cards
      result
    end
  end

  def result
    results = @match.result
    puts 'Result of the round:'
    puts "Your score #{results[0]} (@match.cards) - bot Dealer score #{result[1]} (@match.cards_of_bot)"
    puts 'What to do? 1: Play again!, 2: Exit'
    input = gets.chomp.to_i
    case input
    when 1
      round
    when 2
      puts 'Bye!'
    end
  end

  def show_cards
    puts "ROUND No#{} You got:#{@match.bank}#$ bet = 10$"
    puts 'Player: cards (points)'
    puts "#{@match.player_name}: #{@match.cards.to_s} (#{@match.result[0]})"
    puts "Dealer: ######## (#{'#' * @match.result[0].to_s.size})"
  end

end
