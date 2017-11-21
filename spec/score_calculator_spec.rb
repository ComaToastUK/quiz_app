require './lib/score_calculator.rb'

RSpec.describe ScoreCalculator do
  subject(:score_calculator) { described_class.new }

  describe '#initialize' do
    it 'initializes with a score of 0' do
      expect(subject.score).to eq 0
    end
  end

  describe '#correct_answer' do
    it 'increases the score by 1' do
      expect { subject.correct_answer }.to change { subject.score }.by 1
    end
  end
end
