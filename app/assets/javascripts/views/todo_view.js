var html = "<div class='new-item'><table><thead><tr><th></th><th></th></tr></thead> <tbody><tr><td><h3><input type='checkbox' name='complete' val='1'></h3></td><td><h3> <%= description %> <td> DESTROY </td></tr></tbody></table></div>";

var TodoView = Backbone.View.extend({
  tagName: 'div',
  className: 'todo-item',
  template: _.template(html),
  render: function(){
    // var h3 = "<h3 id='description'>" + this.model.get('description') + "</h3>";
    // var checkbox = "<input type='checkbox' name='description' data-id=" +this.model.get('id')+ ">";
    // var link = "<a href='/todo_items/"+this.model.get('id')+"'>Link</a>"
    var attributes = this.model.toJSON();
    this.$el.html(this.template(attributes));
  }

});
