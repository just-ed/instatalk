class PresenceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update_attribute(:online, true)

    stream_from "presence_channel"

    show_online_users
  end

  def unsubscribed
    current_user.update_attribute(:online, false)

    show_online_users
  end

  private

  def show_online_users
    ActionCable.server.broadcast "presence_channel", users: User.online.as_json
  end
end
