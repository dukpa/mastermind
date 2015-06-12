require './validation'

module HumanInteraction
  include Validation

  def get_code_from_terminal
    code = gets.chomp.split("")
    
    if validated?(code)
      code
    else
      puts "The code must be a 4 digit number."
      get_code_from_terminal
    end
  end

  def hello
    puts "hellO"
  end
end