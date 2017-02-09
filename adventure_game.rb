require './deck.rb'
require 'pry'

class Game
  attr_accessor :deck1, :deck2, :winpile1, :winpile2, :rounds, :wars, :winner

  def initialize
    @deck1 = Deck.new
    @deck2 = Deck.new
    @winpile1 = []
    @winpile2 = []
    @rounds = 0
    @wars = 0
    play
    results
  end

  def playround
    inplay = [deck1.draw, deck2.draw]
    case inplay[0] <=> inplay[1]
    when 1 then winpile1 << inplay
    when 0 then war(inplay)
    when -1 then winpile2 << inplay
    end
    self.rounds += 1
  end

  def play
    playround until deck1.count == 0 || deck2.count == 0
    keybind pry
    self.winner = case winpile1.count <=> winpile2.count
                  when 1 then 'Player 1 won'
                  when 0 then 'Players tied'
                  when -1 then 'Player 2 won'
            end
  end

  def war(pot)
    self.wars += 1
    inplay = [deck1.draw, deck2.draw]
    case inplay[0] <=> inplay[1]
    when 1 then winpile1 << inplay + pot
    when 0 then nil
    when -1 then winpile2 << inplay + pot
    end
  end

  def results
    print "#{winner} won this game after #{rounds} rounds and survived #{wars} WARS. "
  end
end

rematch = 'y'
while rematch == 'y'.downcase
  Game.new
  print 'Would you like a rematch (y/n)?'
  rematch = gets.chomp[0]
end
