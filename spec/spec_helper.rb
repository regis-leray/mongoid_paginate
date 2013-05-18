require 'mongoid'
require 'database_cleaner'
require 'mongoid_paginate'

Mongoid.configure do |config|
  config.connect_to "mongoid_paginate_test"
end

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |file| require file }

DatabaseCleaner.orm = :mongoid

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end