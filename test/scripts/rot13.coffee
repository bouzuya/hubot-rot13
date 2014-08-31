{Robot, User, TextMessage} = require 'hubot'
assert = require 'power-assert'
path = require 'path'
sinon = require 'sinon'

describe 'hello', ->
  beforeEach (done) ->
    @sinon = sinon.sandbox.create()
    # for warning: possible EventEmitter memory leak detected.
    # process.on 'uncaughtException'
    @sinon.stub process, 'on', -> null
    @robot = new Robot(path.resolve(__dirname, '..'), 'shell', false, 'hubot')
    @robot.adapter.on 'connected', =>
      @robot.load path.resolve(__dirname, '../../src/scripts')
      done()
    @robot.run()

  afterEach (done) ->
    @robot.brain.on 'close', =>
      @sinon.restore()
      done()
    @robot.shutdown()

  describe 'listeners[0].regex', ->
    beforeEach ->
      @sender = new User 'bouzuya', room: 'hitoridokusho'
      @callback = @sinon.spy()
      @robot.listeners[0].callback = @callback

    describe 'receive "@hubot rot13 hello"', ->
      beforeEach ->
        message = '@hubot rot13 hello'
        @robot.adapter.receive new TextMessage(@sender, message)

      it 'matches', ->
        assert @callback.callCount is 1
        match = @callback.firstCall.args[0].match
        assert match.length is 2
        assert match[0] is '@hubot rot13 hello'
        assert match[1] is 'hello'

  describe 'listeners[0].callback', ->
    beforeEach ->
      @callback = @robot.listeners[0].callback

    describe 'receive "@hubot rot13 hello!"', ->
      beforeEach ->
        @send = @sinon.spy()
        @callback
          match: ['@hubot rob13 hello!', 'hello!']
          send: @send

      it 'send "uryyb!"', ->
        assert @send.callCount is 1
        assert @send.firstCall.args[0] is 'uryyb!'
