angular.module('TodoApp', [
  'ui.router'
  'restangular'
]).run ($rootScope) ->
  $rootScope._ = _
