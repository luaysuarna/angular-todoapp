angular.module('TodoApp').config [
  'RestangularProvider'
  (RestangularProvider)->
    RestangularProvider.setBaseUrl '/api/v1'
]
