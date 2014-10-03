ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'minitest/rails'

require 'minitest/rails/capybara'

require 'minitest/pride'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical
    # order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in(test_user = :user_1)
      visit new_user_session_path
      fill_in 'Email', with: users(test_user).email
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    def sign_out
      click_on 'Sign out'
    end

    def create_project
      visit new_project_path

      fill_in 'Title', with: 'WOOO'
      fill_in 'Content', with: 'OMG YA'

      click_on 'Create Project'
    end
  end
end

class FeatureSpec < Capybara::Rails::TestCase
  include Capybara::DSL
  Capybara.default_driver = :rack_test
  # Capybara.javascript_driver = :poltergeist
  register_spec_type(/page$/, self)
end
