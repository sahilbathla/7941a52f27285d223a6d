class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :questioms, dependent: :destroy
  has_many :user_topics, dependent: :destroy
  has_many :user_followers, foreign_key: 'follower_id', class_name: 'UserFollowing'
  has_many :followers, through: :user_followers, source: :following
  has_many :user_followings, foreign_key: 'following_id'
  has_many :followings, through: :user_followings, source: :follower
  
  def following?(user)
    UserFollowing.where(follower_id: id, following_id: user.id).any?
  end

  def following_topic?(topic)
    UserTopic.where(user_id: id, topic_id: topic.id).any?
  end
end
