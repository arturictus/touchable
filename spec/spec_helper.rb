$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'touchable'
require 'active_model'
require 'pry'
require 'touchable/matchers'
require './spec/support/model_template'

Dir['./spec/support/*.rb'].each { |f| require f }
Dir['./spec/shared_examples/*.rb'].each { |f| require f }

RSpec.configure do |c|
  c.include Touchable::Matchers
end
