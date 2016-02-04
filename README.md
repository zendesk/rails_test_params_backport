# RailsTestParamsBackport

Backports the :params, :headers and :env options introduced in Rails 5 to older versions of Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_test_params_backport'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_test_params_backport

## Usage

In your test helper, add this line:

```ruby
require 'rails_test_params_backport'
```

You can now rewrite your controller and integration tests from using

```ruby
get :index, id: 1
```

to

```ruby
get :index, params: { id: 1 }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zendesk/rails_test_params_backport.
