class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :lists, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
