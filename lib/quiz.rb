require_relative 'question_store'
require_relative 'printer'

class Quiz
  attr_reader :questions

  def initialize
    @questions = QuestionStore.new.questions
    @printer = Printer.new
  end

  def ask_questions
    @questions.each do |question, key|
      @printer.print(question)
      answer = gets.chomp.to_s
      answer_checker(answer, question)
    end
  end

  def answer_checker(answer, key)
    if answer == @questions[key]
      @printer.print("Correct, the answer is #{@questions[key]}")
      return true
    else
      @printer.print("Incorrect, the answer is #{@questions[key]}")
     return false
    end
  end
end
