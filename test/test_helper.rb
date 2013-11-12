ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
#require 'minitest/rails'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/rspec/matchers'
require 'minitest/rails/capybara'


class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  setup do
    DatabaseCleaner.start
  end
  
  teardown do 
    DatabaseCleaner.clean
  end
  
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
   
  #extend MiniTest::Spec::DSL
  
  #recommended by http://blowmage.com/2013/07/08/minitest-spec-rails4
  
  #register_spec_type self do |desc|
   # desc < ActiveRecord::Base if desc.is_a? Class
  #end
  # Add more helper methods to be used by all tests here...
end

require 'mocha/setup'
