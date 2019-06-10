App.presence = App.cable.subscriptions.create "PresenceChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    App.presence.drawOnlineUsers(data.users)

  drawOnlineUsers: (users) ->
    if (users.length > 0)
      text = "Online: "
      text += users.map((user) -> user.nickname).join(', ')

      $('.js-online-users').text(text)