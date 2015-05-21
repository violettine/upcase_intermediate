class User < ActiveRecord::Base
  include Concerns::Following
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :shouts
end
