require 'test_helper'

describe 'Projects on my desk page' do
  before do
    sign_in
    create_project
  end

  it 'should show projects I created in my desk page' do
    click_on 'My desk'

    page.text.must_include 'WOOO'
  end

  it 'should show projects I joined in my desk page' do
    sign_out
    sign_in :user_2

    click_on 'WOOO'
    click_on 'Join project'
    click_on 'My desk'

    page.text.must_include 'WOOO'
  end
end
