require 'omniauth-oauth2'
require 'omniauth-terracycle/country'

module OmniAuth
  module Strategies
    class TerraCycle < OmniAuth::Strategies::OAuth2
      option :name, 'terracycle'
      option :country_code, :us
      option :base_uri, nil

      def initialize(*args, &block)
        super(*args, &block)

        country_code = options.country_code
        domain = OmniAuth::TerraCycle::Country.domain_for_code(country_code)
        base_uri = options.base_uri || "https://api.terracycle.#{domain}"

        options.client_options = {
          site:          base_uri,
          authorize_url: "#{base_uri}/oauth/authorize",
          token_url:     "#{base_uri}/oauth/token"
        }
      end

      uid do
        account['uuid']
      end

      info do
        account
      end

      def account
        @account ||= access_token.get('/v2/account').parsed['account']
      end
    end
  end
end

OmniAuth.config.add_camelization 'terracycle', 'TerraCycle'
