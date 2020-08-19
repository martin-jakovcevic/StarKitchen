# modelot sekogas go pisuvame vo ednina i modelot se povrzuva so serverot
class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
end
