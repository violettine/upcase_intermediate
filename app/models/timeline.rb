class Timeline
  include ActiveModel::Model
  # extend ActiveModel::Naming

  def initialize(user)
    @user = user
  end

  def shouts
    @user.shouts
  end
end
