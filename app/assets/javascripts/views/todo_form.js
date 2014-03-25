var html = "<form accept-charset='UTF-8' action='/todo_items' class='new_todo_item center' id='new_todo_item' method='post'><div style='margin:0;padding:0;display:inline'><input name='utf8' type='hidden' value='✓'><input name='authenticity_token' type='hidden' value='AVe7bj8BLXu4omhfwYrL3JF/V6DDhjv0e4NuC3PfqaY='></div><div class='field'> <input id='todo_item_description' name='todo_item[description]' type='text' placeholder='Description (e.g., Laundry)'> </div><div class='field' value=<%= description %>><input id='todo_item_notes' name='todo_item[notes]' placeholder='Notes (e.g., Wash whites first)' type='text' value=<%= notes %>></div><div class='actions'> <input name='commit' type='submit' value='Add it to the list.'> </div></form>";

var TodoForm = Backbone.View.extend({
  tagName: 'div',
  className: 'todo_item',
  template: _.template(html),
  render: function(){
    this.$el.html(this.template(this.model.attributes));
    return this;
  }
});


// how do I use this instead of the crap that I have right now in todo_app.js.coffee?
