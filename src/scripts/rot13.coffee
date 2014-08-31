# Description
#   A Hubot script that DESCRIPTION
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot XXX [<args>] - DESCRIPTION
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  rot13 = (keyword) ->
    original = 'abcdefghijklmnopqrstuvwxyz'
    keyword
      .split ''
      .map (c) ->
        index = original.indexOf(c)
        if index >= 0 then original.charAt((index + 13) % 26) else c
      .join ''

  robot.respond /rot13\s+(.+)$/i, (res) ->
    keyword = res.match[1]
    converted = rot13(keyword)
    res.send converted
