class Question < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  has_many :answers, dependent: :destroy

  # Validations
  validates :description, :user, :topic, presence: true
end
