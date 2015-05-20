class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :shouts
  # SELECT * FROM following_relationship WHERE follower_id = ?
  has_many :following_relationship, foreign_key: :follower_id
  # for :followed_user to work we need :following_relationship
  #   to use the follower_id as key, because here follower(_id) is my 
  #   user and he has followed_users whom he follows. With this is 
  #   can use user.followed_users. 
  has_many :followed_users, through: :following_relationship
end
