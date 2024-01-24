class Game

  private
  attr_accessor :move_one
  attr_accessor :move_two
  attr_accessor :total_games
  attr_accessor :num_player_one_wins
  attr_accessor :num_player_two_wins
  attr_accessor :num_ties

  def greetUser()
    puts "Hello, user(s). We are going to Play Rock Paper Scissors!"
  end

  def showScores()
    puts "Total games: #{@total_games}"
    puts "Total player one wins: #{@num_player_one_wins}"
    puts "Total player two wins: #{@num_player_two_wins}"
    puts "Total ties: #{@num_ties}"
  end

  def verifyMove()
    if @moveOne == @moveTwo
      puts "You both threw the same move! You guys tied!"
      num_ties += 1
    elsif (@moveOne == "rock" && @moveTwo == "scissors") || (@moveOne == "paper" && @moveTwo == "rock") || (@moveOne == "scissors" && @moveTwo == "paper")
      puts "Player one threw #{@moveOne}. Player two threw #{@moveTwo}. Player one wins!"
      num_player_one_wins += 1
    else
      puts "Player one threw #{@moveOne}. Player two threw #{@moveTwo}. Player two wins!"
      num_player_two_wins += 1
    end
    total_games += 1
    showScores()
  end

  def inputMoves()
    puts "Player one, type in your move: (Rock, Paper, or Scissors)"
    @move_one =gets.chomp()
    puts "Now player two, type in your move: (Rock, Paper, or Scissors)"
    @move_two = gets.chomp()
    verifyMove()
  end

  public
  def initialize()
    @move_one = ""
    @moveTwo = ""
    @total_games = 0
    @num_player_one_wins = 0
    @num_player_two_wins = 0
    @num_ties = 0

    greetUser()
    inputMoves()
  end

  def move_one=(value)
    @move_one = value
  end

  def move_two=(value)
    @move_two = value
  end

  def total_games=(value)
    @total_games = value
  end

  def num_player_one_wins=(value)
    @num_player_one_wins = value
  end

  def num_player_two_wins=(value)
    @num_player_two_wins = value
  end

  def num_ties=(value)
    @num_ties = value
  end
end


game = Game.new()
