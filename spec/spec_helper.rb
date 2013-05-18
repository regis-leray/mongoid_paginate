require 'mongoid'
require 'mongoid_paginate'

Mongoid.configure do |config|
  config.connect_to "mongoid_paginate_test"
end

Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |file| require file }
