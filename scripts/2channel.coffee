module.exports = (robot) ->

  robot.hear /ちくわ大明神/, (res) ->
    res.send "誰だ今の"

  robot.hear /キター/, (res) ->
    fs = require 'fs'
    data = fs.readFileSync 'scripts/kita.txt', 'utf8'
    kita = data.split(/\n/)
    res.send kita[Math.floor(Math.random() * kita.length)]
