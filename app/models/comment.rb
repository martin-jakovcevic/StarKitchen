class Comment < ApplicationRecord
  belongs_to :recipe
  validates :commenter, :body, presence: true
end