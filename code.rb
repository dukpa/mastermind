require './human_interaction'
require './computer_interaction'

class Code
  include HumanInteraction, ComputerInteraction

  def initialize(option)
    @secret_code = []

    if option == :random
      @secret_code = generate_code
    elsif option == :human
      @secret_code = get_code_from_terminal
    end
  end

  def get_feedback(guess)
    feedback = [];
    
    guess.each_index do |i|
      if guess[i] == @secret_code[i]
        feedback << "*"
      elsif @secret_code.include?(guess[i])
        feedback << "_"
      end
    end
    
    feedback
  end

  def to_s
    @secret_code.join("")
  end
end