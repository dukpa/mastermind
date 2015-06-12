require './code'
require './player'

class Game
  def self.start
    Game.new
  end

  private

  def initialize
    @code = Code.random
    @player = Player.new
    @turns = 0

    start
  end

  def start
    puts "Guess the 4 digit code."
    puts "Each number is only used once."
    puts "* indicates the correct number int he correct place."
    puts "_ indicates the correct number in the wrong place."

    take_turn
  end

  def take_turn
    @turns += 1

    puts "Take a guess..."
    guess = @player.get_guess
    feedback = @code.get_feedback(guess)
    puts "Feedback: #{feedback.join(" ")}"

    if game_over?(feedback)
      end_game(feedback)
    else
      take_turn
    end
  end

  def game_over?(feedback)
    feedback.join("") == "****" || @turns >= 12
  end

  def end_game(feedback)
    if feedback.join("") == "****"
      puts "You guess correctly!"
    else
      puts "You did not guess correctly."
      puts "The code was #{@code}"
    end
  end
end