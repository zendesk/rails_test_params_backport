require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.eager_load = true
    config.action_dispatch.show_exceptions = false
    config.active_support.test_order = :random
    config.active_support.deprecation = :raise
    config.secret_token = "30 somewhat random characters."
  end
end
