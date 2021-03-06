require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Messenger
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    ActionMailer::Base.smtp_settings = {
      :user_name => Rails.application.secrets.email_provider_username,
     :password => Rails.application.secrets.email_provider_password,
     :domain => Rails.application.secrets.domain_name,
     :address => 'smtp.sendgrid.net',
     :port => 587,
     :authentication => :plain,
    :enable_starttls_auto => true
    }

    # ActionMailer Config
    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.raise_delivery_errors = true
    # Send email in development mode?
    config.action_mailer.perform_deliveries = true

  end
end
