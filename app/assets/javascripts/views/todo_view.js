var html = "<div class='new-item'><table><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><h3><input type='checkbox' name='complete' val='1'></h3></td><td><h3><%= description %></h3></td><td><a href='/todo_items/<%= id %>/edit'>Edit</a></td><td><a id='destroy' data-method='delete' href='/todo_items/<%= id %>' rel='nofollow'>Destroy</a></td></tr></tbody></table></div>";

var TodoView = Backbone.View.extend({
  tagName: 'div',
  className: 'todo_item',
  template: _.template(html),
  render: function(){
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }

});
