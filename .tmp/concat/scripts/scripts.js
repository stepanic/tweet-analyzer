(function () {
  'use strict';
  angular.module('tweetAnalyzerApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ]).config([
    '$routeProvider',
    function ($routeProvider) {
      return $routeProvider.when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      }).otherwise({ redirectTo: '/' });
    }
  ]);
}.call(this));
/*
//@ sourceMappingURL=app.js.map
*/
(function () {
  'use strict';
  angular.module('tweetAnalyzerApp').controller('MainCtrl', [
    '$scope',
    function ($scope) {
      return $scope.awesomeThings = [
        'HTML5 Boilerplate',
        'AngularJS',
        'Karma'
      ];
    }
  ]);
}.call(this));  /*
//@ sourceMappingURL=main.js.map
*/