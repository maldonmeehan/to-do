require 'rails_helper'

describe "the delete a list process" do
  it "deletes a list" do
    list = List.create(:name => "Learn Rails")
    visit list_path(list)
    click_on "Delete List"
    expect(page).to have_content "Lists"
  end
end
