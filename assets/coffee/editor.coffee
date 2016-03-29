angular = require 'angular'
app = angular.module 'EditorApp', []
EditorCtrl = require './editor-ctrl'

app.controller 'EditorCtrl', ['$scope', '$location', EditorCtrl]
