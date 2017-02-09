
class Card
  include Comparable
  attr_accessor :face, :value, :suit

  def initialize(suit:, face:)
    @face = face
    @suit = suit
    @value = self.class.faces.index(face) + 2
  end

  def <=>(other)
    value <=> other.value
  end

  def self.faces
    Array(2..10) + %w(J Q K A)
  end

  def self.suits
    %w(Hearts Diamonds Clubs Spades)
  end
end
