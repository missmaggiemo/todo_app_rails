window.TodoApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert 'Hello from Backbone!'

# htmlNewItemForm = "<div class='new-item'><div class='form'><form accept-charset='UTF-8' action='/todo_items' class='new_todo_item' id='new_todo_item' method='post'><label for='description'>What do you need to do?</label><input type='text' name='description' value=''><input type='submit' name='submit' value='Add it to the list.'></form></div></div>"

htmlNewItemForm = "<form accept-charset='UTF-8' action='/todo_items' class='new_todo_item' id='new_todo_item' method='post'><div style='margin:0;padding:0;display:inline'><input name='utf8' type='hidden' value='✓'><input name='authenticity_token' type='hidden' value='AVe7bj8BLXu4omhfwYrL3JF/V6DDhjv0e4NuC3PfqaY='></div><div class='field'> <label for='todo_item_description'>Description</label><br> <input id='todo_item_description' name='todo_item[description]' type='text'> </div> <div class='field'> <label for='todo_item_complete'>Complete</label><br> <input name='todo_item[complete]' type='hidden' value='0'><input id='todo_item_complete' name='todo_item[complete]' type='checkbox' value='1'> </div> <div class='actions'> <input name='commit' type='submit' value='Create Todo item'> </div></form>"


$(document).ready ->
  # TodoApp.initialize()

  $('#new').click ->
    event.preventDefault()
    $(".todo_items").html(htmlNewItemForm)
    $(".todo_items").find('form').submit (event) ->
      event.preventDefault()
      attr1 = $('form').find('input[id=todo_item_description]').val()
      attr2 = $('form').find('input:checkbox').is(':checked')
      todoItem = new TodoItem()
      todoItem.set({description: attr1, complete: attr2})
      todoItem.save({success: console.log("WAT")})
      todoView = new TodoView({model: todoItem})
      todoView.render()
      $(this).closest('.todo_items').html(todoView.el)

  # $('#new').click(function(event){
  #   event.preventDefault();
  #   $(".todo-item").html(htmlNewItemForm);
  #
  #   $(".todo-item").find('#todo-form').submit(function(event){
  #     event.preventDefault();
  #     var descrip = $('#todo-form').find('input[name=description]').val()
  #     todoItem = new TodoItem();
  #     todoItem.set({description: descrip});
  #     todoItem.save();
  #     console.log(todoItem.get('id'));
  #     todoView = new TodoView({model: todoItem});
  #     todoView.render();
  #     $(this).closest('.todo-list').html(todoView.el);
  #   });
