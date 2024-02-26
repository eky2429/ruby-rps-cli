require 'minitest/autorun'
require './rps'

class TestRPS < Minitest::Test
  def test_user_won
    game = Game.new
    game.player_move = "rock"
    game.playGame("scissors")
    assert_equal 1, game.scores[1], "Assertion player won failed!"
  end
  
  def test_user_lose
    game = Game.new
    game.player_move = "rock"
    game.playGame("paper")
    assert_equal 1, game.scores[2], "Assertion player lost failed!"
  end

  def test_user_tied
    game = Game.new
    game.player_move = "rock"
    game.playGame("rock")
    assert_equal 1, game.scores[3], "Assertion player tied failed!"
  end

  def test_game_played
    game = Game.new
    game.player_move = "rock"
    game.playGame()
    assert_equal 1, game.scores[0], "Assertion game played failed!"
  end

  def test_play_many_games
    game = Game.new
    game.player_move = "rock"
    game.playGame("rock")
    game.playGame("paper")
    game.playGame("scissors")
    game.player_move = "paper"
    game.playGame("rock")
    game.playGame("paper")
    game.playGame("scissors")
    game.player_move = "scissors"
    game.playGame("rock")
    game.playGame("scissors")
    assert_equal 8, game.scores[0], "Assertion play many games - total games failed!"
    assert_equal 2, game.scores[1], "Assertion play many games - player wins failed!"
    assert_equal 3, game.scores[2], "Assertion play many games - cpu wins failed!"
    assert_equal 3, game.scores[3], "Assertion play many games - tied games failed!"
    assert_equal (2.to_f()/3), (game.scores[1].to_f() / game.scores[2]), "Assertion play many games - win ratio failed!"
  end
end
