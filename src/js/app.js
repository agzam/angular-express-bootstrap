var app, indexCtrl;

require("angular/angular");

require("angular-route/angular-route");

indexCtrl = require("./index-controller");

app = angular.module('app', ['ngRoute']);

app.config([
  '$routeProvider', function($routeProvider) {
    return $routeProvider.when("/", {
      templateUrl: 'static/templates/index.html',
      controller: indexCtrl
    });
  }
]);
