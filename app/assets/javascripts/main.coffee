ENTER_KEY = 13
$ ->
  $(".todo-list table tbody").sortable()

  todoHeaderHandlers = new TodoHeaderHandlers()
  todoHeaderHandlers.showActionButtons()
  todoHeaderHandlers.editTodoHeader()
  todoHeaderHandlers.removeTodo()
  todoHeaderHandlers.updateTodoHeader()

  todoBarHandlers = new TodoBarHandlers()
  todoBarHandlers.button()
  todoBarHandlers.keypress()

  todoListHandlers = new TodoListHandlers()
  todoListHandlers.showActions()
  todoListHandlers.finishTask()
  todoListHandlers.editTask()
  todoListHandlers.taskKeypress()
  todoListHandlers.taskBlur()
  todoListHandlers.removeTask()

class TodoHeaderHandlers
  showActionButtons: ->
    $('.todo-header')
    .mouseover ->
      $(@).find('ul').removeClass('hidden')
    .mouseout ->
      $(@).find('ul').addClass('hidden')

  editTodoHeader: ->
    $('.todo-action-edit').on 'click', (e) ->
      e.preventDefault()
      $(@).parents('.todo-header')
      .addClass('edit-mode')
      .find('input')
      .val($('.todo-header h3').text())
      .focus()

  removeTodo: ->
    $('.todo-action-remove').on 'click', (e) ->
      e.preventDefault()
      if confirm 'Are you sure ?'
        $(@).parents('article').hide()

  updateTodoHeader: ->
    $('.todo-header input').on 'blur', (e) =>
      @._cancelEditing($(e.currentTarget))

    $('.todo-header input').on 'keypress', (e) =>
      if e.which is ENTER_KEY
        @._cancelEditing($(e.currentTarget))

  _cancelEditing: (input) ->
    input.parent('.todo-header')
    .removeClass('edit-mode')
    .find('h3')
    .text(input.val())

class TodoBarHandlers
  button: ->
    $('.todo-bar-new button').on 'click', (e) =>
      e.preventDefault()
      @._newTask($(e.currentTarget))

  keypress: ->
    $('.todo-bar-new input').on 'keypress', (e) =>
      if e.which is ENTER_KEY
        e.preventDefault()
        @._newTask($(e.currentTarget).next('button'))

  _newTask: (button) ->
    taskInput = button.prev('input')
    taskText = taskInput.val()
    taskTable = button.parents('article').find('table tbody')
    newTaskRow = taskTable.find('tr:last').clone()
    newTaskRow.find('.todo-list-task p').text(taskText)
    taskTable.append(newTaskRow)
    taskInput.val('')

class TodoListHandlers
  showActions: ->
    $('.todo-list')
      .on 'mouseover', 'tr', ->
        $(@).find('ul').removeClass('hidden')
      .on 'mouseout', 'tr', ->
        $(@).find('ul').addClass('hidden')

  finishTask: ->
    $('.todo-list table').on 'change', 'tr .todo-list-checkbox input', (e) =>
      @._completeTask($(e.currentTarget))

  editTask: ->
    $('.todo-list').on 'click', 'tr .todo-list-task-edit', (e) =>
      e.preventDefault()
      todoListTask = $(e.currentTarget).parents('tr').find('.todo-list-task')
      unless todoListTask.hasClass('edit-mode')
        todoListTask.addClass('edit-mode')
        textToBeEdited = todoListTask.find('p').text()
        todoListTask.append(@._editTaskInput()).find('input').val(textToBeEdited).focus()

  taskKeypress: ->
    $('.todo-list').on 'keypress', 'tr .todo-list-task input', (e) =>
      if e.which is ENTER_KEY
        e.preventDefault()
        @._cancelTaskEditing($(e.currentTarget))

  taskBlur: ->
    $('.todo-list').on 'blur', 'tr .todo-list-task input', (e) =>
      e.preventDefault()
      @._cancelTaskEditing($(e.currentTarget))

  removeTask: ->
    $('.todo-list').on 'click', 'tr .todo-list-task-delete', (e) ->
      e.preventDefault()
      if confirm 'Are you sure ?'
        $(@).parents('tr').remove()

  _completeTask: (elem) ->
    elem.parents('tr').toggleClass('completed-task')

  _cancelTaskEditing: (input) ->
    parent = input.parent()
    parent.find('p').text(input.val())
    parent.find('input')?.remove()
#    parent.hasClass('edit-mode')?removeClass('edit-mode')
    parent.removeClass('edit-mode')

  _editTaskInput: () ->
    "<input type='text' name='' value=''>"