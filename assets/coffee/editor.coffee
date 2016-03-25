angular = require 'angular'
app = angular.module 'EditorApp', []

class EditorController
  save_data: []
  latest:
    html: ""
    goml: ""
    js: ""
  html: ""
  iframe_url: ""
  run: ->
    @save_data.push @latest
    console.log @latest
    console.log "called"
    @latest.html = ""
    # $request.post('/api/codes', )
    # send @latest, (url) ->
    #   @iframe_url = url

app.controller 'EditorController', EditorController
