module ZendeskEngine
  module Configuration
    VALID_CONFIG_KEYS    = [:url, :email, :token]

    DEFAULT_URL   = nil
    DEFAULT_EMAIL = nil
    DEFAULT_TOKEN = nil

    # Build accessor methods for every config options so we can do this, for example:
    #   Awesome.format = <img src="http://s2.wp.com/wp-includes/images/smilies/icon_mad.gif?m=1129645325g" alt=":x" class="wp-smiley"> ml
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def configure
      yield self if block_given?
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def reset
      self.url   = DEFAULT_URL
      self.email = DEFAULT_EMAIL
      self.token = DEFAULT_TOKEN
    end

  end # Configuration
end

