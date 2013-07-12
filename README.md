# UWAPI

This gem is a wrapper for University of Waterloo's Open Data API.

## Installation

Add this line to your application's Gemfile:

    gem 'uwapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uwapi

## Usage

1. Go to http://api.uwaterloo.ca/ and register for an API key.
2. Use the gem.
3. ???
4. Profit.

```ruby
api = UWAPI.new(:api_key => 'foo')
weather = api.Weather
buildings = api.Buildings
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
