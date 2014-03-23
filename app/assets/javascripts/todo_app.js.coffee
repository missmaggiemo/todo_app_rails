window.TodoApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log("Welcome to Backbone.js!")


htmlNewItemForm = "<form accept-charset='UTF-8' action='/todo_items' class='new_todo_item center' id='new_todo_item' method='post'><div style='margin:0;padding:0;display:inline'><input name='utf8' type='hidden' value='✓'><input name='authenticity_token' type='hidden' value='AVe7bj8BLXu4omhfwYrL3JF/V6DDhjv0e4NuC3PfqaY='></div><div class='field'> <input id='todo_item_description' name='todo_item[description]' type='text' placeholder='Description (e.g., Laundry)'> </div><div class='field'><input id='todo_item_notes' name='todo_item[notes]' placeholder='Notes (e.g., Wash whites first)' type='text'></div><div class='actions'> <input name='commit' type='submit' value='Add it to the list.'> </div></form>"

$(document).ready ->
  TodoApp.initialize()

  delay = (ms, func) -> setTimeout func, ms

  $('.todo_item').on('click', '#notes_link', (event) ->
    event.preventDefault()
    $(this).closest('.todo_item').find('#notes').fadeToggle(200)
    );


  $('#new').click (event) ->
    event.preventDefault()
    $(".todo_items").append(htmlNewItemForm)
    $(".todo_items").find('form').submit (event) ->
      event.preventDefault()
      attr1 = $('form').find('input[id=todo_item_description]').val()
      attr2 = $('form').closest('.todo_items').data('list')
      attr3 = $('form').find('input[id=todo_item_notes]').val()
      todoItem = new TodoItem()
      todoCol = new TodoCollection()
      todoItem.set({description: attr1, complete: false, list_id: attr2, notes: attr3})
      todoItem.save()

      delay 300, ->
        todoCol.fetch({success: (collection) ->
          todoItem = collection.last()
          todoView = new TodoView({model: todoItem})
          todoView.render()
          $('form').remove()
          $('.todo_items').append(todoView.el)})


  $('#clear').click (event) ->
    event.preventDefault()
    $('input:checkbox:checked').closest('.todo_item').each ->
      console.log($(this).find('#destroy'))
      $(this).find('#destroy').click()
      $(this).remove()
