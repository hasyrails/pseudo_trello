class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
