$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchable'
require 'active_model'

Dir['./spec/support/*.rb'].each { |f| require f }
Dir['./spec/shared_examples/*.rb'].each { |f| require f }
