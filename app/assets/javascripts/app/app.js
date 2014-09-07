angular.module('StockApp', ['ngRoute', 'StockApp.controllers', 'myApp.services'])
.config(function($routeProvider) {
  $routeProvider.when('/', {
    templateUrl: '/templates/dashboard.html',
    controller: 'HomeController',
    resolve: {
      session: function(SessionService) {
        return SessionService.getCurrentUser();
      }
    }
  })
  .otherwise({
    redirectTo: '/'
  });
});
