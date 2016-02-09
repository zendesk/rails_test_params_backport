require 'rails_test_params_backport/version'
require 'active_support'
require 'action_dispatch'

module RailsTestParamsBackport
  ParameterError = Class.new(RuntimeError)

  ERROR_MESSAGE = <<-EOS.gsub(/^ {4}/, '')
    Test HTTP request methods will accept only
    the following keyword arguments in future Rails versions:
    params, headers, env
    Examples:
    get '/profile',
      params: { id: 1 },
      headers: { 'X-Extra-Header' => '123' },
      env: { 'action_dispatch.custom' => 'custom' }
    Please change your arguments to reflect this change.
  EOS

  class << self
    def offensive_parameters?(parameters)
      offensive_parameters = parameters.keys - %i(params headers env)
      offensive_parameters.any?
    end
  end
end

require 'rails_test_params_backport/rails3' if ActiveSupport::VERSION::MAJOR == 3
require 'rails_test_params_backport/rails4' if ActiveSupport::VERSION::MAJOR == 4

ActionController::TestCase.prepend(RailsTestParamsBackport::TestCase)
ActionController::TestCase::Behavior.prepend(RailsTestParamsBackport::TestCase)

ActionDispatch::Integration::Session.prepend(RailsTestParamsBackport::IntegrationSession)
