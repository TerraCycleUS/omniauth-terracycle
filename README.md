# OmniAuth Terracycle

This is the official OmniAuth strategy for authenticating to TerraCycle.
To use it, you'll need to set up an OAuth2 application on the
TerraCycle Developer Portal's Applications page.

**Be sure you set up the application at the country's Developer Portal you want to access data from. For example, an appliction created at the TerraCycle France's Developer Portal will only be able to access data from our French website!**

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-terracycle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-terracycle

## Usage

```ruby
use OmniAuth::Builder do
  provider :terracycle, ENV['TERRACYCLE_APP_KEY'], ENV['TERRACYCLE_APP_SECRET'],
           :scope => 'account_read join_brigade leave_brigade',
           :country_code => :us
end
```

If you indend to use `omniauth-terracycle` with [Devise](https://github.com/plataformatec/devise), be sure to read their [OmniAuth Guide](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview).

## Configuration

Config options can be passed to provider via a Hash:

`scope`: A space-separated list of permissions.

`country_code`: By default the strategy uses TerraCycle USA site.
The `country_code` param must be provided if you want to target another TerraCycle country.

For the full list of country codes check out [**lib/omniauth-terracycle/country.rb**](http://github.com/terracycle/omniauth-terracycle/blob/master/lib/omniauth-terracycle/country.rb)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
