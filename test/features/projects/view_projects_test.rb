require 'test_helper'

describe 'View projects on web page' do
  before do
    sign_in
  end
  it 'should let users view projects on index' do
    visit root_path

    page.text.must_include projects(:project_1).title
  end

  it 'should let users view projets show page' do
    visit project_path(projects(:project_1))

    page.text.must_include projects(:project_1).title
  end
end
