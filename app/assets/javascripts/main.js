'use strict';

var app = angular.module('StockApp', ['ngResource', 'ngRoute', 'ui.select2']).
config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.otherwise({
      redirectTo: '/home'
    });
  }
]);
