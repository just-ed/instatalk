App.presence = App.cable.subscriptions.create "PresenceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('PresenceChannel connected')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('PresenceChannel disconnected')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log('PresenceChannel received')

    App.presence.drawOnlineUsers(data.users)

  drawOnlineUsers: (users) ->
    if (users.length >0)
      text = "Online: "
      text += users.map((user) -> user.nickname).join(', ')

      $('.js-online-users').text(text)