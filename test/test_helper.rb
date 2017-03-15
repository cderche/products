ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end


  # Add more helper methods to be used by all tests here...
end
