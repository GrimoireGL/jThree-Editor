angular = require 'angular'
app = angular.module 'EditorApp', []

class EditorCtrl
  constructor: ($sce, $http) ->
    @sce = $sce
    @request  = $http
    @save_data = []
    @latest =
      html: ""
      goml: ""
      js: ""
    @iframe_url = ""

  run: ->
    @save_data.push @latest
    @send()

  set_iframe_url: (url) ->
    console.log @sce.trustAsResourceUrl(url), url
    @iframe_url = @sce.trustAsResourceUrl url

  send: ->
    @request
      .post '/api/code', @latest
      .then (res) =>
          console.log res
          @set_iframe_url res.data.url
        , (err) ->
          console.error err

app.controller 'EditorCtrl', ['$sce', '$http', EditorCtrl]
