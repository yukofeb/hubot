module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    messages = if req.body.payload? then JSON.parse req.body.payload else req.body

    for message in messages
      robot.messageRoom "#{room}", "#{message.events.id}"
    res.end "OK"
