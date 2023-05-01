require './Question.rb'
require './Player.rb'

class Game

  attr_accessor :current_player, :current_turn
  
  # generates Players and decides who goes first
  def initialize
    @player1 = Player.new('P1')
    @player2 = Player.new('P2')
    @current_turn = 1
    puts "----- LET'S GET COUNTING -----"
    coin_flip
    puts "#{@current_player.name}, you go first"
    puts "----- ROUND 1 -----"
    report_score
    ask_question
  end

  # see who goes first and sets current_player
  def coin_flip
    if rand(2) == 0
      @current_player = @player1
    else
      @current_player = @player2
    end
  end

  # uses a while loop to keep asking a Question until a player reaches 0 lives.
  def ask_question
    question = Question.new
    if !question.correct
      @current_player.lose
    end
    report_score
    switch_players

    # checks if either player has no more lives, ends game if so
    if (@player1.lives > 0 && @player2.lives > 0)
      puts "Now it's your turn #{current_player.name}"
      puts "----- ROUND #{@current_turn += 1} -----"
      ask_question
    else
      end_game
    end

  end

  # switch players after each question
  def switch_players
    @current_player = (@current_player == @player1 ? @player2 : @player1)
  end

  def report_score
    puts "SCORE: #{@current_player.name}: #{@player1.lives}/3 VS #{@player2.name}: #{@player2.lives}/3"
  end

  # declares the winner of the game
  def end_game
    if (@player1.lives == 0)
      puts "RESULT: Player 2 wins because Player 1 can not add"
    else
      puts "RESULT: Player 1 wins because Player 2 can not add"
    end
    puts "----- GAME OVER, PLAY AGAIN SOON -----"
  end
  
end
