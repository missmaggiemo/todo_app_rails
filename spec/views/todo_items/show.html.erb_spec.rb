require 'spec_helper'

describe "todo_items/show" do
  before(:each) do
    @todo_item = assign(:todo_item, stub_model(TodoItem,
      :description => "Description",
      :complete => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/false/)
  end
end
