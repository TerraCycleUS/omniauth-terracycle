module OmniAuth
  module TerraCycle

    # TODO: Move this to a separate gem. (And extend functionality as needed)
    #   In case if we develop gems like this, it's handy to have common
    #   place from where country-specific data can be extracted.
    class Country
      DOMAINS = {
        ar: 'com.ar',
        at: 'at',
        au: 'com.au',
        be: 'be',
        br: 'com.br',
        ca: 'ca',
        ch: 'ch',
        de: 'de',
        dk: 'dk',
        es: 'es',
        fr: 'fr',
        hu: 'hu',
        ie: 'ie',
        il: 'co.il',
        it: 'it',
        jp: 'co.jp',
        mx: 'com.mx',
        nl: 'nl',
        no: 'no',
        nz: 'co.nz',
        pr: 'pr',
        se: 'se',
        tr: 'com.tr',
        uk: 'co.uk',
        us: 'com'
      }

      def self.domain_for_code(country_code)
        DOMAINS[country_code.to_sym]
      end
    end
  end
end
