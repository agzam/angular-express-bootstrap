require "angular/angular"
require "angular-route/angular-route"
indexCtrl = require("./index-controller")

app = angular.module('app',['ngRoute'])

app.config ['$routeProvider', ($routeProvider)->
   $routeProvider.when "/",
      templateUrl: 'static/templates/index.html'
      controller: indexCtrl
]

