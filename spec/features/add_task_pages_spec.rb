require 'rails_helper'

describe 'the add a task process' do
  it "adds a task" do
    list = List.create(:name => "Home stuff")
    visit list_path(list)
    click_on 'Add a task'
    fill_in 'Description', :with => 'Wash the dog'
    click_on 'Create Task'
    expect(page).to have_content 'Wash the dog'
  end

  it "gives error when no description is entered" do
    list = List.create(:name => "Home stuff")
    visit list_path(list)
    click_on 'Add a task'
    click_on 'Create Task'
    expect(page).to have_content 'errors'
  end
end
