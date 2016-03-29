qs = require 'qs'
objectAssign = require 'object-assign'
generateIframe = require './generate-iframe'

class EditorCtrl
  constructor: (@scope, @location) ->
    @state =
      goml: ""
      js: ""
    @setStateFromUrl()
    @watchUrl()

  watchUrl: =>
    window.addEventListener "hashchange", @setStateFromUrl

  updateUrl: =>
    location.href = location.href.split('#')[0]+"#?"+qs.stringify(@state)

  setStateFromUrl: =>
    query = location.hash.match(/#\?(.+$)/)?[1] || ""
    @state = objectAssign @state, qs.parse(query)

  run: =>
    generateIframe @state.goml, @state.js

module.exports = EditorCtrl
