class UserTopic < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  # Validations
  validates :user, :topic, presence: true
  validates :topic, uniqueness: { scope: :user, message: :already_following }
end
