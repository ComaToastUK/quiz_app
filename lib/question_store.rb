class QuestionStore
  attr_reader :questions

  def initialize
    @questions = { 'What is the capital of Turkey?' => 'Ankhara',
                   'What is the national animal of China?' => 'Giant Panda',
                   'Which Turkish city has the name of a cartoon character?' => 'Batman',
                   'What is the noisiest city in the world?' => 'Hong Kong',
                   'What is the name of the desert area in Mexico?' => 'Sonora',
                   'What is a very cold part of Russia?' =>  'Siberia',
                   'How many continents are there?' => 'Seven',
                   'On which Italian island is Palermo?' => 'Sicily',
                   'How many time zones are there in the world?' => '24',
                   'Which is the largest desert on earth?' => 'Sahara' }
  end
end
