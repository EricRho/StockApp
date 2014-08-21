app.factory('Stock', ['$resource', function($resource) {
  function Stock() {
    this.service = $resource('/api/stocks/:stockId', {stockId: '@id'});
  }
  Stock.prototype.all = function() {
    return this.service.query();
  };
  Stock.prototype.create = function(attr) {
    return this.service.save(attr);
  };
  Stock.prototype.delete = function(stId) {
    this.service.remove({stockId: stId});
  };
  return new Stock;
}]);
