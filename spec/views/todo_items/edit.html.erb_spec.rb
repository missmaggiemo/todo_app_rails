require 'spec_helper'

describe "todo_items/edit" do
  before(:each) do
    @todo_item = assign(:todo_item, stub_model(TodoItem,
      :description => "MyString",
      :complete => false
    ))
  end

  it "renders the edit todo_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", todo_item_path(@todo_item), "post" do
      assert_select "input#todo_item_description[name=?]", "todo_item[description]"
      assert_select "input#todo_item_complete[name=?]", "todo_item[complete]"
    end
  end
end
