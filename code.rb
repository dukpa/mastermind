class Code
  def self.random
    Code.new(:random)
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

  private

  def initialize(option)
    @secret_code = []

    if option == :random
      while @secret_code.length < 4
        @secret_code = (1..4).map { |i| (rand * 10).to_i.to_s }
        @secret_code.uniq!
      end
    end
  end
end