module ApplicationHelper
  def users_online
    User.online.pluck(:nickname).join(', ')
  end
end
