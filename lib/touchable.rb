require "touchable/version"
require 'active_support/all'

module Touchable
  include ActiveSupport::Configurable

  config_accessor(:perform_touchable) { true }
  config_accessor(:execute_on_touchable)
end

require 'touchable/base'
