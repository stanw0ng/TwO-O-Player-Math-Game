class Question

  attr_accessor :correct

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    
    puts "What #{@num1} plus #{@num2}?"
    answer_question
  end

  def answer_question
    @input_answer = gets.chomp

    # .to_s because gets returns a string
    if @input_answer == @answer.to_s
      puts 'Correct! You can add!'
      @correct = true
    else
      puts 'Wrong! You can not add!'
      @correct = false
    end
  end
end
