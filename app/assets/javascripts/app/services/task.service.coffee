angular.module('TodoApp').factory 'TaskService', [
  'Restangular'
  (Restangular) ->
    {
      create: (task) ->
        Restangular.one('todos').post(undefined, { task: task })
      list: ->
        Restangular.one('todos').get()
      switchActive: (task) ->
        Restangular.one("todos/#{task.id}/activator").put()
    }
]
