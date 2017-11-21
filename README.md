# Quiz App

This is a quiz app written in Object-Oriented Ruby and tested in rspec.

### How to play

```
$ git clone http://github.com/comatoastuk/quiz_app
$ irb
require './lib/quiz.rb'
quiz = Quiz.new
quiz.ask_questions
```

### Extensions

The QuestionStore can be extended with a question library, an array of question
pack hashes. A quiz will be selected using either a select_quiz method calling
an index or by a sample method to pick a random quiz.
