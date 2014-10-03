require 'test_helper'

describe 'Sign out of web page' do
  it 'should let signed users sign out' do
    sign_in

    click_on 'Sign out'

    page.text.must_include 'Signed out successfully.'
  end
end
