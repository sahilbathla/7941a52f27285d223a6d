require 'test_helper'

class UserTopicTest < ActiveSupport::TestCase
  def test_following_again
    @user_topic = UserTopic.create(user: User.first, topic: Topic.last)
    assert_equal @user_topic.valid?, true

    @user_topic = UserTopic.create(user: User.first, topic: Topic.last)
    assert_equal @user_topic.valid?, false
  end
end
