angular.module('TodoApp').config [
  '$stateProvider'
  '$urlRouterProvider'
  '$locationProvider'
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    homeState = {
      name: 'home',
      url: '/',
      template: JST['homes/index']
    }

    todoState = {
      name: 'todo',
      url: '/todos',
      controller: 'TodosController',
      template: JST['todos/index']
    }

    $stateProvider.state(homeState)
    $stateProvider.state(todoState)

    $urlRouterProvider.otherwise '/'

    $locationProvider.html5Mode {
      enabled: true
      requireBase: false
    }
]
