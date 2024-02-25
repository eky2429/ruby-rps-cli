require 'minitest/autorun'
require './rps'

class TestRPS < Minitest::Test
  def test_move
    game = Game.new
    game.move_one = "rock"
    assert_equal "rock", game.move_one, "M"
  end

  def test_move2
    game = Game.new
    game.move_one = "popcorn"
  end
end
