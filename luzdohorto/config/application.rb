require_relative 'boot'

require 'rails/all'
ENV['RAILS_ADMIN_THEME'] = 'rollincode'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LzdH
  class Application < Rails::Application
  	config.i18n.enforce_available_locales = false
    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = :'pt-BR'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

end
