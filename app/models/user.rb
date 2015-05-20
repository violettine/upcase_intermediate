class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :shouts
  # SELECT * FROM following_relationship WHERE follower_id = ?
  has_many :followed_user_relationship, foreign_key: :follower_id,
                                        class_name: 'FollowingRelationship'
  # for :followed_user to work we need :following_relationship
  #   to use the follower_id as key, because here follower(_id) is my
  #   user and he has followed_users whom he follows. With this is
  #   can use user.followed_users.
  has_many :followed_users, through: :followed_user_relationship
  # SELECT * FROM follower_relationship WHERE followed_user_id = ?
  has_many :follower_relationship, foreign_key: :followed_user_id,
                                   class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationship

  def following?(user)
    followed_user_ids.include? user.id
  end

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end
end
