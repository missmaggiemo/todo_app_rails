// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var TodoItem = Backbone.Model.extend({
  idAttribute: 'id',
  defaults: {
    description: "Default",
    complete: false
  },
  urlRoot: '/todo_items'
});
