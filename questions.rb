class Question
    attr_accessor :player

  def initialize(player)
    @num1 = rand(1..15)
    @num2 = rand(1..15)
    @sum = (@num1 + @num2).to_s
    @player = player

  end

  def ask_question
    puts "#{@player} - What does #{@num1} plus #{@num2} equal?"
  end

  def check_answer(player_answer)
    @sum == player_answer
  end

end
