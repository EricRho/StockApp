app.controller('TabsController', ['$scope', function($scope) {
  $scope.tabs = [{
      title: 'My Profile',
      url: 'one.tpl.html'
    }, {
      title: 'My Stocks',
      url: 'two.tpl.html'
    }, {
      title: 'News Feed',
      url: 'three.tpl.html'
  }];

  $scope.currentTab = 'one.tpl.html';

  $scope.onClickTab = function(tab) {
    $scope.currentTab = tab.url;
  };

  $scope.isActiveTab = function(tabUrl) {
    return tabUrl == $scope.currentTab;
  };
}]);
