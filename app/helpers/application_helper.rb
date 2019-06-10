module ApplicationHelper
  def users_online
    User.online.map(&:nickname).join(', ')
  end
end
