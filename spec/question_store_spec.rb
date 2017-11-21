require './lib/question_store.rb'

RSpec.describe QuestionStore do
  subject(:question_store) { described_class.new }

  describe '#questions' do
    it 'contains 10 question/answer pairs' do
      expect(subject.questions.length).to eq 10
    end
  end
end
