var TodoCollection = Backbone.Collection.extend({
    model: TodoItem,
    url: '/todo_items'
});
