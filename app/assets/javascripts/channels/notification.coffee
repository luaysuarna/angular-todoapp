room = $('#room')

App.notification = App.cable.subscriptions.create {
    channel: "NotificationChannel",
  }, {
    connected: ->
      console.log('connected')

    disconnected: ->
      console.log('disconnected')

    received: (data) ->
      alert(data.message)

    check: (message) ->
      @perform 'speak', message: message
  }
