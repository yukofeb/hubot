module.exports = (robot) ->

  robot.router.post "/papertrail/alert", (req, res) ->
    room_name = "monitor"
    message = req.body.message

    robot.send {room: room_name}, message
    res.end "send #{room_name} #{message}"
