# modelot sekogas go pisuvame vo ednina i modelot se povrzuva so serverot
class Recipe < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
end
