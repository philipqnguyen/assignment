require 'test_helper'

describe 'Sign up page' do
  it 'should let an unsigned user to sign up for the first time' do
    visit root_path
    click_on 'Sign up'

    fill_in 'Username', with: 'bob_tester'
    fill_in 'Email', with: 'bob@tester.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create account'

    page.text.must_include 'You have signed up successfully.'
  end
end
