require 'test_helper'

describe 'Create projects on web page' do
  it 'should let users create projects with proper attribution' do
    sign_in
    visit new_project_path

    fill_in 'Title', with: 'WOOO'
    fill_in 'Content', with: 'OMG YA'
    click_on 'Create Project'

    page.text.must_include 'successfully created'
    page.text.must_include users(:user_1).username
  end
end
