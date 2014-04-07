require 'omniauth-oauth2'
require 'omniauth-terracycle/country'

module OmniAuth
  module Strategies
    class TerraCycle < OmniAuth::Strategies::OAuth2
      option :name, 'terracycle'
      option :country_code, :us

      def initialize(*args, &block)
        super(*args, &block)

        country_code = options.country_code
        domain = OmniAuth::TerraCycle::Country.domain_for_code(country_code)
        base_uri = "https://api.terracycle.#{domain}"

        options.client_options = {
          site:          "#{base_uri}/v2",
          authorize_url: "#{base_uri}/oauth/authorize",
          token_url:     "#{base_uri}/oauth/token"
        }
      end

      uid { raw_info['uuid'] }

      info do
        profile = raw_info['profile']
        first_name = profile['first_name']
        last_name = profile['last_name']
        name = "#{first_name} #{last_name}"

        {
          name: name,
          first_name: first_name,
          last_name: last_name,
          email: raw_info['email'],
          profile: profile
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/account').parsed['account']
      end
    end
  end
end

OmniAuth.config.add_camelization 'terracycle', 'TerraCycle'
