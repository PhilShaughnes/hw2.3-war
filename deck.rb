require "./card.rb"
require 'pry'

class Deck < Array
  def initialize
    Card.suits.each do |s|
      Card.faces.each{ |f| self << Card.new(suit: s, face: f)}
    end
    self.shuffle!
  end

  def draw
    self.shift
  end
end
