class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  # Validations
  validates :description, :user, :question, presence: true
end
