class UserFollowing < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
  
  validates :follower, :following, presence: true
  validates :follower_id, uniqueness: { scope: :following_id, message: :already_following }

  validate :no_self_follow, on: :create
  
  private
  
  def no_self_follow
    if follower_id == following_id
      self.errors.add(:base, I18n.t('user_following.self_follow_error'))
    end
  end
end
