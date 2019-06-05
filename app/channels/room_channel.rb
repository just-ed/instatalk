class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    logger.info "Subscribed to RoomChannel, roomId: #{params[:roomId]}"

    @room = Room.find(params[:roomId])

    stream_from "room_channel_#{@room.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.info 'Unsubscribed from RoomChannel'
  end

  def speak(data)
    logger.info "RoomChannel, speak: #{data.inspect}"

    ActionCable.server.broadcast "room_channel_#{@room.id}", message: data['message']
  end
end
