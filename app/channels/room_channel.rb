class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info 'Subscribed to RoomChannel'

    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info 'Unsubscribed from RoomChannel'
  end

  def speak(data)
    logger.info "RoomChannel, speak: #{data.inspect}"

    ActionCable.server.broadcast 'room_channel', message: 'Hello from server'
  end
end
