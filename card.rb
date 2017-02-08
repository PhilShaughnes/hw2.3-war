
class Card
  attr_accessor :face, :value, :suit

  def initialize(suit:, face:)
    @face = face
    @suit = suit
    @value = vset(face)
  end

  def vset(f)
    case
    when f.to_i != 0 then f.to_i
    when f == 'j' then 11
    when f == 'q' then 12
    when f == 'k' then 13
    when f == 'a' then 14
    end
  end

end
