module.exports = (robot) ->

  robot.router.post '/papertrail/alert/:room', (req, res) ->
    room = req.params.room
    #messages = if req.body.payload? then JSON.parse req.body.payload else req.body
    messages = JSON.parse(req.body.payload)

    for event in messages.events
      robot.messageRoom "#{room}", "id : #{event.id}\nsource ip : #{event.source_ip}\nmessage : #{message}\nreceived_at : #{received_at}\nseverity : #{severity}\n"
    robot.messageRoom "#{room}", "#{messages.saved_search.html_search_url}"
    res.end "OK"
