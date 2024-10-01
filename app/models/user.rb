class User < ApplicationRecord
  validates :login, :name, presence: true
  validates :login, uniqueness: true 
end
