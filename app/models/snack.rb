class Snack < ApplicationRecord

  validates :title, presence: true
  validates :category, presence: true
  validates :body, presence: true

end
