module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    message = if req.body.payload? then JSON.parse req.body.payload else req.body
    console.log "[message]"
    console.log "#{message}"

    robot.messageRoom "#{room}", "#{message.events.id}"
    res.end "OK"
