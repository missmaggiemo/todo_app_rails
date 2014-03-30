var html = "<table><tbody><tr><td><h3><input type='checkbox' name='complete' val='1'></h3></td><td><h3><a href='#' id='notes_link'><%= description %></a></h3></td><td><a id='edit' href='/todo_items/<%= id %>/edit'>Edit</a></td><td><a id='destroy' data-method='delete' href='/todo_items/<%= id %>' rel='nofollow'>Destroy</a></td></tr></tbody></table><div class='notes_holder'><p id='notes' style='display: none'><%= notes %></p></div>";

var TodoView = Backbone.View.extend({
  tagName: 'div',
  className: 'todo_item',
  template: _.template(html),
  events: {
    'click #notes_link': 'fadeNotes',
    'click #edit':
  },

  fadeNotes: function(event){
    event.preventDefault();
    this.$('#notes').fadeToggle(200);
  },

  editItem: function(event){
    // stuff should go here
  },

  render: function(){
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }

});
