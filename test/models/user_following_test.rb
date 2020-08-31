require 'test_helper'

class UserFollowingTest < ActiveSupport::TestCase
  def test_following_again
    @user_following = UserFollowing.create(follower: User.first, following: User.last)
    assert_equal @user_following.valid?, true

    @user_following = UserFollowing.create(follower: User.first, following: User.last)
    assert_equal @user_following.valid?, false
  end
  
  def test_no_self_follow
    @user_following = UserFollowing.create(follower: User.first, following: User.first)
    assert_equal @user_following.valid?, false
  end
end
