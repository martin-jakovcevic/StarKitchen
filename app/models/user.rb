class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 255}
  validates :email, presence: true length: {maximum: 50}
end
