require_relative 'question_store'
require_relative 'printer'
require_relative 'score_calculator'

class Quiz
  attr_reader :questions

  def initialize
    @questions = QuestionStore.new.questions
    @printer = Printer.new
    @scoreCalculator = ScoreCalculator.new
  end

  def ask_questions
    @questions.each do |question, _key|
      @printer.print(question)
      answer = gets.chomp.to_s
      answer_checker(answer, question)
    end
  end

  def answer_checker(answer, key)
    if answer == @questions[key] && !@questions[key].nil?
      @printer.print("Correct, the answer is #{@questions[key]}")
      @scoreCalculator.correct_answer
      true
    elsif answer != @questions[key] && !@questions[key].nil?
      @printer.print("Incorrect, the answer is #{@questions[key]}")
      false
    elsif @questions[key].nil?
      @printer.print("Quiz complete! You scored #{@scoreCalculator.score} points")
      exit
    end
  end
end
