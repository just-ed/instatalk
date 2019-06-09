class PresenceChannel < ApplicationCable::Channel
  def subscribed
    current_user.update_attribute(:online, true)

    stream_from "presence_channel"

    ActionCable.server.broadcast "presence_channel", users: User.online.as_json
  end

  def unsubscribed
    current_user.update_attribute(:online, false)
  end
end
