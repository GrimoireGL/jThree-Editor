qs = require 'qs'
objectAssign = require 'object-assign'
generateIframe = require './generate-iframe'
Editor = require './ace'
gomlEditor = new Editor 'goml'
jsEditor = new Editor 'javascript'

class EditorCtrl
  constructor: (@scope, @location) ->
    @state =
      goml: ""
      js: ""
    @setStateFromUrl()
    @watchEditors()


  # watchUrl: =>
  #   @setStateFromUrl()
  #   window.addEventListener "hashchange", @setStateFromUrl

  watchEditors: =>
    gomlEditor.watch (code) =>
      @setStateFromEditor goml: code
    jsEditor.watch (code) =>
      @setStateFromEditor js: code
    document.getElementById('execute').addEventListener 'click', =>
      @run()

  updateUrl: =>
    location.href = location.href.split('#')[0]+"#?"+qs.stringify(@state)

  setState: (state, cb) =>
    @state = objectAssign @state, state
    cb && cb()

  setStateFromUrl: =>
    query = location.hash.match(/#\?(.+$)/)?[1] || ""
    @setState qs.parse(query), =>
      jsEditor.setCode @state.js
      gomlEditor.setCode @state.goml

  setStateFromEditor: (obj) =>
    @setState obj, =>
      @updateUrl()

  run: =>
    generateIframe @state.goml, @state.js

module.exports = EditorCtrl
