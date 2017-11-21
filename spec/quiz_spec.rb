require './lib/quiz.rb'

RSpec.describe Quiz do
  subject(:quiz) { described_class.new }

  questionStore = { 'What is the capital of Turkey?' => 'Ankhara',
                    'What is the national animal of China?' => 'Giant Panda',
                    'Which Turkish city has the name of a cartoon character?' => 'Batman',
                    'What is the noisiest city in the world?' => 'Hong Kong',
                    'What is the name of the desert area in Mexico?' => 'Sonora',
                    'What is a very cold part of Russia?' =>  'Siberia',
                    'How many continents are there?' => 'Seven',
                    'On which Italian island is Palermo?' => 'Sicily',
                    'How many time zones are there in the world?' => '24',
                    'Which is the largest desert on earth?' => 'Sahara' }

  stdoutMock = "What is the capital of Turkey?\n""Correct, the answer is Ankhara\n""What is the national animal of China?\n""Incorrect, the answer is Giant Panda\n""Which Turkish city has the name of a cartoon character?\n""Incorrect, the answer is Batman\n""What is the noisiest city in the world?\n""Incorrect, the answer is Hong Kong\n""What is the name of the desert area in Mexico?\n""Incorrect, the answer is Sonora\n""What is a very cold part of Russia?\n""Incorrect, the answer is Siberia\n""How many continents are there?\n""Incorrect, the answer is Seven\n""On which Italian island is Palermo?\n""Incorrect, the answer is Sicily\n""How many time zones are there in the world?\n""Incorrect, the answer is 24\n""Which is the largest desert on earth?\n""Incorrect, the answer is Sahara\n"

  describe '#questions' do
    it 'has 10 questions' do
      allow_any_instance_of(Quiz)
        .to receive(:questions)
        .and_return(questionStore)
      expect(subject.questions.length).to eq 10
    end
  end

  describe '#ask_questions' do
    it 'prints a question' do
      answer = 'Ankhara'
      allow_any_instance_of(Quiz)
        .to receive(:questions)
        .and_return(questionStore)
      allow_any_instance_of(Quiz)
        .to receive(:gets)
        .and_return(answer)
      expect { subject.ask_questions }.to output(stdoutMock).to_stdout
    end
  end

  describe '#answer_checker' do
    it 'checks if an answer is correct' do
      allow_any_instance_of(Quiz)
        .to receive(:questions)
        .and_return(questionStore)
      key = 'What is the capital of Turkey?'
      answer = 'Ankhara'
      expect(subject.answer_checker(answer, key)).to eq true
    end

    it 'returns false if answer is incorrect' do
      allow_any_instance_of(Quiz)
        .to receive(:questions)
        .and_return(questionStore)
      key = 'What is the capital of Turkey?'
      answer = 'Istanbul'
      expect(subject.answer_checker(answer, key)).to eq false
    end

    it 'gives the score at the end of the game' do
      answer = 'Ankhara'
      key = nil
      emptyQuestions = {}
      allow_any_instance_of(Quiz)
        .to receive(:questions)
        .and_return(emptyQuestions)
      allow_any_instance_of(Quiz)
        .to receive(:gets)
        .and_return(answer)
      expect { subject.answer_checker(answer, key) }.to output('Quiz complete! You scored 0 points').to_stdout
    end
  end
end
