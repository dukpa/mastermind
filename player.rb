class Player
  def initialize
  end

  def get_guess
    guess = gets.chomp.split("")
    
    if validate(guess)
      guess
    else
      puts "The guess must be a 4 digit number."
      get_guess
    end
  end

  private

  def validate(guess)
    guess.length == 4 &&
      guess.uniq.length == 4 &&
      guess.all? { |i| "0123456789".include?(i) }
  end
end