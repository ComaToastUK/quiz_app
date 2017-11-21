class ScoreCalculator
  attr_reader :score
  def initialize
    @score = 0
  end

  def correct_answer
    @score += 1
  end
end
