module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    message = if req.body.payload? then JSON.parse req.body.payload else req.body
    console.log "[room]"
    console.log room
    console.log "[message]"
    console.log message
    console.log "[message.min_id]"
    console.log message.min_id
    console.log "[message.events]"
    console.log message.events

    robot.messageRoom "#{room}", "#{message.min_id}"
    res.end "send #{room} #{message}"
