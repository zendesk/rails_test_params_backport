Rails.application.configure do
  config.cache_classes = true

  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false
  config.active_support.test_order = :random

  config.active_support.deprecation = :stderr
end
