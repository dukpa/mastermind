require './code'
require './player'

class Game
  def self.start(human_player=true)
    Game.new(human_player)
  end

  private

  def initialize(human_player=true)
    if human_player
      @code = Code.new(:random)
    else
      puts "Enter a 4 digit code for the computer to guess"
      @code = Code.new(:human)
    end
    

    @player = Player.new(human_player)
    @turns = 0

    start
  end

  def start
    take_turn
  end

  def take_turn
    @turns += 1

    puts "Take a guess..." if @player.human?
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
      puts "#{@player.name} guessed correctly!"
    else
      puts "#{@player.name} did not guess correctly."
      puts "The code was #{@code}" if @player.human?
    end
  end
end