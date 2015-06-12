require './validation'

module ComputerInteraction
  include Validation

  def known_values
    @known_values ||= {}
  end

  def generate_code
    code = []
    code = (1..4).map { |i| (rand * 10).to_i.to_s } until validated?(code)
    code
  end

  def analyze_feedback(guess, feedback)
    #To do
  end
end