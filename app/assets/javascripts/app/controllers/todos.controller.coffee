angular.module('TodoApp').controller('TodosController', [
  '$rootScope'
  '$scope'
  'TaskService'
  ($rootScope, $scope, Task) ->
    # 
    # Init Value
    # 
    $scope.title     = "Todo Application"
    $scope.hideDone  = true
    $scope.needEnter = false
    Task.list().then(
      (response) ->
        console.log(window.r = response.tasks)
        $scope.tasks = response.tasks
    )

    # 
    # Scope Functions Libararies
    # 
    $scope.addTask = (task) ->
      Task.create(task).then(
        (response) ->
          if response.success
            $scope.tasks.push(response.task)
      )
      $scope.newTask = {}
      $scope.needEnter = false
    $scope.switchDone = (index, e) ->
      $el = $(e.currentTarget)
      $wrapper = $el.closest('li')

      toggleStatusTask($scope.tasks[index]).then(
        (response) ->
          if $el.is(':checked')
            $scope.tasks[index]['done'] = true
      )
    $scope.switchActive = (index, e) ->
      toggleStatusTask($scope.tasks[index]).then(
        (response) ->
          $scope.tasks[index]['done'] = false
      )
    $scope.toggleShowDone = ->
      $scope.hideDone = $scope.hideDone == false ? true : false
    $scope.$watch 'newTask.name', (value)->
      checkNewTask(value)

    # 
    # Local Functions
    # 
    checkNewTask = (value) ->
      if !_.isUndefined(value)
        if value.length
          $scope.needEnter = true
        else
          $scope.needEnter = false
    toggleStatusTask = (task) ->
      Task.switchActive(task)
]);

