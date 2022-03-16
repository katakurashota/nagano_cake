require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    Refile.secret_key = '639e91689998e65355d9e63a629693f14a4edc009f6a6feb66b884c2dadb0b5b010a3f88ebcdc88c057ee13b6499dd3e96be70be8f68aceb52219d5b66b83e94'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
