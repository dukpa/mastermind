require './human_interaction'
require './computer_interaction'

class Player
  include HumanInteraction, ComputerInteraction
  attr_reader :name

  def initialize(human=true)
    @human = human

    if @human
      @name = "You"
    else
      @name = "The computer"
    end
  end

  def get_guess
    if @human
      get_code_from_terminal
    else
      generate_guess
    end
  end

  def generate_guess
    print "Guessing... "
    sleep(1)

    guess = generate_code
    puts guess.join("")
    guess
  end

  def human?
    @human
  end
end