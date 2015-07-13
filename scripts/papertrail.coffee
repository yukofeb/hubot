module.exports = (robot) ->

  robot.router.post '/papertrail/alert', (req, res) ->
    room = "monitor"
    message = if req.body.payload? then JSON.parse req.body.payload else req.body

    robot.messageRoom room, message
    res.end "send #{room_name} #{message}"
