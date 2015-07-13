module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    messages = if req.body.payload? then JSON.parse req.body.payload else req.body

    for event in messages.events
      robot.messageRoom "#{room}", "#{event.id}"
      console.log "#{event.id}
    res.end "OK"
