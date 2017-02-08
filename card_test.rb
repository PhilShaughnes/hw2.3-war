require "./card.rb"
require 'minitest/autorun'

class CardTest < MiniTest::Test

  def setup
    card = Card.new(suit: "diamonds", face: 5)
  end

  def test_attributes_exist
    assert c(5).suit
    assert c(5).face
    assert c(5).value
  end

  def test_ace_value_14

  end

  def test_king_value_13

  end

  def test_queen_value_12

  end

  def test_jack_value_11

  end

  def test_card_compare

  end

  def c(f)
    Card.new(suit: "diamonds", face: f)
  end

end
