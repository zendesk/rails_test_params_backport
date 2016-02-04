require 'rails_test_params_backport/version'
require 'active_support'
require 'action_dispatch'

module RailsTestParamsBackport
  ERROR_MESSAGE = <<-EOS
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
    attr_accessor :raise_on_offence

    def verify_parameters(parameters)
      offensive_parameters = parameters.keys - %i(params headers env)
      return unless offensive_parameters.any?
      raise RailsTestParamsBackport::ParameterError, ERROR_MESSAGE
    end
  end

  class ParameterError < RuntimeError
  end
end

require 'rails_test_params_backport/rails3' if ActiveSupport::VERSION::MAJOR == 3
require 'rails_test_params_backport/rails4' if ActiveSupport::VERSION::MAJOR == 4

ActionController::TestCase::Behavior.prepend(RailsTestParamsBackport::TestCaseParamsBackport)
ActionDispatch::Integration::Session.prepend(RailsTestParamsBackport::IntegrationSessionParamsBackport)
