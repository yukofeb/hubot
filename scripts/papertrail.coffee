module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    messages = if req.body.payload? then JSON.parse req.body.payload else req.body

    for event in messages.events
      robot.messageRoom "#{room}", 
        "[ALERT]id : #{event.id}\n
         source ip : #{event.source_ip}\n
         message : #{event.message}\n
         received_at : #{event.received_at}\n
         severity : #{event.severity}\n"
    robot.messageRoom "#{room}", "#{messages.saved_search.html_search_url}"
    res.end "OK"
