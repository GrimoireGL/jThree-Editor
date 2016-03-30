qs = require 'qs'
objectAssign = require 'object-assign'
generateIframe = require './generate-iframe'
Editor = require './ace'
gomlEditor = new Editor 'goml'
jsEditor = new Editor 'javascript'
beautify = require('js-beautify')
jsBeautify = beautify.js_beautify
gomlBeautify = beautify.html_beautify
$ = require 'jquery'

class EditorCtrl
  constructor: (@scope, @location) ->
    @state =
      goml: ""
      js: ""
    @setStateFromUrl()
    @watchEditors()

  watchEditors: =>
    gomlEditor.watch (code) =>
      @setStateFromEditor goml: code
    jsEditor.watch (code) =>
      @setStateFromEditor js: code
    window.onhashchange = =>
      console.log @state
    $ =>
      $ '#execute'
        .click =>
          @run()
      $ '#reformat'
        .click =>
          @format()


  updateUrl: =>
    location.replace location.href.split('#')[0]+"#?"+qs.stringify(@state)

  setState: (state, cb) =>
    @state = objectAssign @state, state
    cb && cb()

  setStateFromUrl: =>
    query = location.hash.match(/#\?(.+$)/)?[1] || ""
    @setState qs.parse(query), =>
      @setCode @state

  setCode: (state) =>
    jsEditor.setCode state.js
    gomlEditor.setCode state.goml

  setStateFromEditor: (obj) =>
    @setState obj, =>
      @updateUrl()

  format: =>
    goml = gomlBeautify @state.goml, indent_size: 2
    js = jsBeautify @state.js, indent_size: 2
    @setState { goml, js }, =>
      @setCode @state

  run: =>
    generateIframe @state.goml, @state.js

module.exports = EditorCtrl
