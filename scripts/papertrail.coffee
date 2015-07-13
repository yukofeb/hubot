module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    message = if req.body.payload? then JSON.parse req.body.payload else req.body

    robot.messageRoom "#{room}", "#{message.event}"
    res.end "send #{room} #{message}"
