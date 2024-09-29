class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true 
  validates :slug, presence: true, uniqueness: true 

  scope :recent, -> { order(created_at: :desc) } 
end
