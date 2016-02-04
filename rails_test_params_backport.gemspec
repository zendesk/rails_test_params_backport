# coding: utf-8
require_relative 'lib/rails_test_params_backport/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_test_params_backport'
  spec.version       = RailsTestParamsBackport::VERSION
  spec.authors       = ['Pierre Schambacher']
  spec.email         = ['pschambacher@zendesk.com']

  spec.summary       = 'Write Rails 5 style tests in your Rails 3 or Rails 4 application.'
  spec.description   = 'Backports the :params, :headers and :env options introduced in Rails 5 to older versions of Rails.'
  spec.homepage      = 'https://github.com/zendesk/rails_test_params_backport'
  spec.files         = Dir.glob('lib/**/*')
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 3.2.0', '< 5.0'
  spec.add_dependency 'actionpack',    '>= 3.2.0', '< 5.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'bump'
  spec.add_development_dependency 'wwtd'
  spec.add_development_dependency 'byebug'
end
