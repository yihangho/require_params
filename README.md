# require_params
require_params ensures that parameters that your API actions require are present.

## Usage
Include `RequireParams` to your `ApplicationController`:

```ruby
class ApplicationController < ActionController::API
  include RequireParams
end
```

Use the `require_params` class method in your controllers to specify which parameters are required for which actions:

```ruby
class UsersController < ApplicationController
  require_params [:username, :email, :password], only: :create

  def create
    # Do important stuff here
  end
end
```

If any one of the required parameters is missing, your action handler will not be called at all. Instead, an error hash that looks like this will be served with 400 Bad Request:

```ruby
{
  errors: [{
    username: ["is missing"],
    password: ["is missing"]
  }]
}
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'require_params'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install require_params
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
