require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def test_validation_blank
    @answer = Answer.new(user: User.first, description: '', question: Question.first)
    assert_equal @answer.valid?, false
  end

  def test_validation_nil
    @answer = Answer.new(user: User.first, description: nil, question: Question.first)
    assert_equal @answer.valid?, false
  end

  def test_no_user
    @answer = Answer.new(user: nil, description: 'Test', question: Question.first)
    assert_equal @answer.valid?, false
  end

  def test_no_question
    @answer = Answer.new(user: User.first, description: 'Test')
    assert_equal @answer.valid?, false
  end

  def test_valid
    @answer = Answer.new(user: User.first, description: 'Test', question: Question.first)
    assert_equal @answer.valid?, true
  end
end
