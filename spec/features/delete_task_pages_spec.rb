require 'rails_helper'

describe "the delete a task process" do
  it "deletes a task" do
    list = List.create(:name => "Study stuff")
    task = Task.create(:description => "Learn React", :list_id => list.id)
    visit list_path(list)
    click_link 'Delete'
    expect(page).to have_content("Study stuff")
  end

end
