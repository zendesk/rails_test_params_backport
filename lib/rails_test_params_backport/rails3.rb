module RailsTestParamsBackport
  module TestCase
    def process(action, parameters = nil, session = nil, flash = nil, http_method = 'GET')
      parameters = parameters.to_h

      if RailsTestParamsBackport.offensive_parameters?(parameters) || session || flash
        raise(ParameterError, ERROR_MESSAGE)
      end

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      session = headers.merge(env)

      super(action, parameters[:params], session, flash, http_method)
    end
  end

  module IntegrationSession
    def process(method, path, parameters = nil, rack_env = nil)
      parameters = parameters.to_h

      if RailsTestParamsBackport.offensive_parameters?(parameters) || rack_env
        raise(ParameterError, ERROR_MESSAGE)
      end

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      rack_env = headers.merge(env)

      super(method, path, parameters[:params], rack_env)
    end
  end
end
