class Timeline
  include ActiveModel::Model
  # extend ActiveModel::Naming

  def initialize(user)
    @user = user
  end

  # give shouts of all users to dashboard at once
  #   dont give back shouts and users separated
  def shouts
    Shout.where(user_id: shout_user_ids)
  end

  private

  def shout_user_ids
    [@user.id] + @user.followed_user_ids
  end
end
