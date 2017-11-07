require_relative 'question_store'
require_relative 'printer'

class Quiz

  attr_reader :questions

  def initialize
    @questions = QuestionStore.new.questions
    @printer = Printer.new
  end

  def ask_questions
    @questions.each {|key|
      @printer.print(key)
      answer = gets.chomp
      answer = answer.to_s
      answer_checker(answer, key)
    }
  end

  def answer_checker(answer, key)
    if answer == @questions[key]
      return "Correct, the answer is #{@questions[key]}"
    else
      return "Incorrect, the answer is #{@questions[key]}"
    end
  end

end
