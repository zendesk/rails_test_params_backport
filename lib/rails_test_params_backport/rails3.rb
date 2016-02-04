module RailsTestParamsBackport
  module TestCaseParamsBackport
    def process(action, parameters = nil, session = nil, flash = nil, http_method = 'GET')
      parameters = parameters.to_h

      RailsTestParamsBackport.verify_parameters(parameters)

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      session = headers.merge(env)

      super(action, parameters[:params], session, flash, http_method)
    end
  end

  module IntegrationSessionParamsBackport
    def process(method, path, parameters = nil, rack_env = nil)
      parameters = parameters.to_h

      RailsTestParamsBackport.verify_parameters(parameters)

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      rack_env = headers.merge(env)

      super(method, path, parameters[:params], rack_env)
    end
  end
end
