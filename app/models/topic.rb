class Topic < ApplicationRecord
  has_many :questions
  has_many :user_topics, dependent: :destroy
  
  # Validations
  validates :name, presence: true
end
