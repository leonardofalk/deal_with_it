# DealWithIt

![DealWithIt](./dealwithit.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deal_with_it'
```

And then execute:

```
$ bundle
```

## Usage

Include the handler base on your ApplicationController or in any class you wish to handle.

```ruby
class ApplicationController < ActionController::Base
  include DealWithIt
end
```

Create your custom handler anywhere in the app.

```ruby
# app/handlers/record_not_found_handler.rb
class RecordNotFoundHandler < DealWithIt::Handler
  deal ActiveRecord::RecordNotFound, with: ->(error) do
    render json: { 'Oopsie, we didn\'t found that stuff' }, status: :not_found
  end
end
```

Note that `render` is a method that comes from the ActionController itself, it could be any method from the class that included the DealWithIt module.

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/leonardofalk/deal_with_it>.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
