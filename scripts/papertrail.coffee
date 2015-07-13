module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    #messages = if req.body.payload? then JSON.parse req.body.payload else req.body
    messages = JSON.parse(req.body.payload)

    for event in messages.events
      console.log "#{event.id}"
      robot.messageRoom "#{room}", "#{event.id}"
    res.end "OK"
