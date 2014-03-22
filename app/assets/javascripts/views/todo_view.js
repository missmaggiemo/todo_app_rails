var html = "<div class='new-item'><table><tbody><tr><td><h3><input type='checkbox' name='complete' val='1'></h3></td><td><h3><a href='/todo_items/<%= id %>'><%= description %></a></h3></td><td><a href='/todo_items/<%= id %>/edit'>Edit</a></td><td><a id='destroy' data-method='delete' href='/todo_items/<%= id %>' rel='nofollow'>Destroy</a></td></tr></tbody></table><div class='notes_holder'><a href='#' id='notes_link'>Notes</a><p id='notes' style='display: none'><%= notes %></p></div></div>";

var TodoView = Backbone.View.extend({
  tagName: 'div',
  className: 'todo_item',
  template: _.template(html),
  events: {
    'click #notes_link': 'fadeNotes'
  },

  fadeNotes: function(event){
    event.preventDefault();
    this.$('#notes').fadeToggle(200);
  },

  render: function(){
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }

});
