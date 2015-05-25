module Netscanner
  module Version
    MAJOR = 1
    MINOR = 0
    PATCH = 0
    #PRERELEASE = 'rails-4.2'

    def self.full
      version = "#{MAJOR}.#{MINOR}.#{PATCH}"
      version = "#{version}-#{PRERELEASE}" if defined? PRERELEASE
      version
    end

    def self.gem
      full.gsub('-', '.pre.')
    end
  end

  # (see Version.gem)
  GEM_VERSION = Version.gem

  # (see Version.full)
  VERSION = Version.full
end
