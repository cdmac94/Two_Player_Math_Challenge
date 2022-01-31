require './player'
require './questions' 

class Game 

  def initialize
    
        puts "Welcome to Math Challenge!"
        puts "Who is Player 1?"
        @input1 = $stdin.gets.chomp
        puts "Who is Player 2?"
        @input2 = $stdin.gets.chomp
    
        @player1 = Player.new(@input1)
        @player2 = Player.new(@input2)
  end

  def start

    puts "Welcome #{@player1.name} and #{@player2.name}! Get ready to compete"
    puts "We'll start with #{@player1.name}..."

    turn

  end

  def turn
    @player1_Q = Question.new(@player1.name)
    @player1_Q.ask_question
    @answer1 = $stdin.gets.chomp
    if(@player1_Q.check_answer(@answer1))
      puts "Correct! now for #{@player2.name}..."
    end
    if (!@player1_Q.check_answer(@answer1))
      puts "WOMP WOMP #{@player1.name} loses a life! How will you do #{@player2.name}?"
      @player1.wrong
    end

    @player2_Q = Question.new(@player2.name)
    @player2_Q.ask_question
    @answer2 = $stdin.gets.chomp
    if(@player2_Q.check_answer(@answer2))
      puts "Correct!"
    end
    if (!@player2_Q.check_answer(@answer2))
      puts "WOMP WOMP #{@player2.name} loses a life!"
      @player2.wrong
    end

    puts "#{@player1.name} you have #{@player1.lives}/3 lives left and #{@player2.name} you have #{@player2.lives}/3 left!"

    game_over?
    puts "---------NEXT TURN---------"
    turn
    
  end

  def game_over?
    if(@player1.lives == 0)
      puts "A winner has been declared! Congratulations #{@player2.name}! you won with #{@player2.lives} left!"
      puts "--------GAME OVER--------"
      exit(true)
    end

    if(@player2.lives == 0)
      puts "A winner has been declared! Congratulations #{@player1.name}! you won with #{@player1.lives} lives left!"
      puts "--------GAME OVER--------"
      exit(true)
    end
  end

end
