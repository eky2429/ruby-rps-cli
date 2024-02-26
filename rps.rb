class Game
  attr_reader :player_move
  attr_reader :computer_move
  attr_reader :scores

  def initialize()
    @player_move = ""
    @computer_move = ""
    # About @scores:
    #   1st element - total games played
    #   2nd element - games player won
    #   3rd element - games CPU won
    #   4th element - tied games
    @scores = [0, 0, 0, 0] 
  end

  def player_move=(value)
    @player_move = value
  end


  def printStats()
    puts "Total games: #{@scores[0]}"
    puts "Total player one wins: #{@scores[1]}"
    puts "Total player two wins: #{@scores[2]}"
    puts "Total ties: #{@scores[3]}"
    if @scores[2] == 0
      puts "Your win to lose ratio (times player won / times CPU won): 0"
    else 
      puts "Your win to lose ratio (times player won / times CPU won): #{(@scores[1].to_f / @scores[2]).round(2)}"
    end
    puts "Your recent move: #{@player_move}"
    puts "The CPU's recent move: #{@computer_move}"
  end

  #Displays instructions
  def printInstructions()
    puts "Rock Paper Scissors is a fun game to enjoy!"
    puts "Normally, this game is played by two people, but in this one,"
    puts "you play against a CPU / Robot."
    
    puts "\nHow cool is that? :)"

    puts "\nAnyway, to play a move, you have to type in either 'rock', 'paper', or 'scissors' to play."
    puts "Also, avoid adding extra spaces or unnecessary characters to your input (The program won't like that)"
    puts "When you play a move, the CPU will also play a move. (rock, paper, or scissors)\n"

    puts "There are many ways to win the game."
    puts "For example, you play rock, and the CPU plays scissors"
    puts "or you play paper, and the CPU plays rock"
    puts "and possibly you play scissors, and the CPU plays paper."

    puts "\nIn those cases, you would win. However, if the CPU plays rock"
    puts "and you play scissors, or the CPU plays paper, and you play rock,"
    puts "or the CPU plays scissors, and you play paper, then you lose. :("

    puts "\nBut it's okay if you lose because you can play again and again, and"
    puts "you can try to beat the CPU more times than it did. :) *thumbs-up*"
    puts "\n But if you both play the same move, then neither one of you win; it is a tie"

    puts "\nDon't worry, I will keep track of your status for the duration of this program running."
    puts "If you want to check your status, type 'stats' to see your progress in the game."

    puts "\nIf you want to stop playing or close this program, type 'x'"
    puts "And I'll wait for you again. ;)"

    puts "\n I think that's all I got. So, you should be good to go. All right, let's start!"
  end

  def playGame(cpu_mode = "")
    if cpu_mode == ""
      @computer_move = ['rock', 'paper', 'scissors'].sample()
    else
      @computer_move = cpu_mode
    end
    scores[0] += 1

    puts "You played #{@player_move}"
    puts "The CPU played #{@computer_move}"

    if @computer_move == @player_move
      scores[3] += 1
      puts "You are both tied!"
    elsif (@player_move == 'rock' && @computer_move == 'scissors') || (@player_move == 'paper' && @computer_move == 'rock') || (@player_move == 'scissors' && @computer_move == 'paper')
      scores[1] += 1
      puts "You won!"
    else
      scores[2] += 1
      puts "You didn't win!"
    end
    
    puts "Let's play again!"
  end

  def verifyMove()
    @player_move = @player_move.downcase
    if @player_move == "rock" || @player_move == "paper" || @player_move == "scissors"
      #Play game is user inputs move
      playGame()
    elsif @player_move == "help"
      #Show instructions if user needs help
      printInstructions()
    elsif @player_move == "stats"
      #Show states if user requests it
      printStats()
    elsif @player_move == "x"
      #Show states if user requests it
      puts "Aw, I'm sad to see you go :("
      puts "But I'm sure I'll see you later! *waves good-bye*"
      return ""
    else
      #Otherwise, tell uer his/her input is invalid
      puts "Invalid move. Try again."
    end
    inputMove()
  end

  def inputMove()
    puts ""
    puts "Player, type in your move: (type 'help' you need help)" #Asks player for input
    @player_move = gets.chomp() #Gets input
    puts ""
    verifyMove() #Verifies input
  end

  def startProgram()
    puts "Hello, user(s). We are going to Play Rock Paper Scissors!" #Greet user
    inputMove() #Ask for input
  end

end
