require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class TerraCycle < OmniAuth::Strategies::OAuth2
      option :name, 'terracycle'
      option :locale, 'en-US'
      option :base_uri, nil

      def initialize(*args, &block)
        super(*args, &block)

        locale = options.locale
        base_uri = options.base_uri || "https://api.terracycle.com/#{locale}"

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
