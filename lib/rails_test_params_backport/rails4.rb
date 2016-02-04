module RailsTestParamsBackport
  module TestCase
    def process(action, http_method = 'GET', *args)
      parameters = args[0].to_h

      RailsTestParamsBackport.verify_parameters(parameters)

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      session = headers.merge(env)

      super(action, http_method, parameters[:params], session)
    end
  end

  module IntegrationSession
    def process(method, path, parameters = nil, headers_or_env = nil)
      parameters = parameters.to_h

      RailsTestParamsBackport.verify_parameters(parameters)

      headers = parameters.fetch(:headers, {})
      env = parameters.fetch(:env, {})
      headers_or_env = headers.merge(env)

      super(method, path, parameters[:params], headers_or_env)
    end
  end
end
