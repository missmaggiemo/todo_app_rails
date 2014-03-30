var html = "<table><tbody><tr><td><h3><input type='checkbox' name='complete' val='1'></h3></td><td><h3><a href='#' id='notes_link'><%= description %></a></h3></td><td><a id='edit' href='/todo_items/<%= id %>/edit'>Edit</a></td><td><a id='destroy' data-method='delete' href='/todo_items/<%= id %>' rel='nofollow'>Destroy</a></td></tr></tbody></table><div class='notes_holder'><p id='notes' style='display: none'><%= notes %></p></div>";

var TodoView = Backbone.View.extend({
  tagName: 'div',
  className: 'todo_item',
  template: _.template(html),
  events: {
    'click input': 'check',
    'click #notes_link': 'fadeNotes',
    'click #edit': 'editItem',
    'click #destroy': 'deleteItem'
    // these events only work with items that I've generated via the view
  },

  check: function(event){
    var val = this.$('input').val();
    if(val === 'false' || val === 'on'){
      this.$('input').val(true);
    } else {
      this.$('input').val(false);
    }
    console.log(this.$('input').val());
  },

  fadeNotes: function(event){
    event.preventDefault();
    this.$('#notes').fadeToggle(200);
  },

  editItem: function(event){
    // edit item form
  },

  deleteItem: function(event){
    // event.preventDefault();
    // console.log(this);
    // this.model.destroy();
    // this.$el.remove();
  },

  render: function(){
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }

});
