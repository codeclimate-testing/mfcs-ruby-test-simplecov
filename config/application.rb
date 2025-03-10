require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "pp"
require 'English'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mfcs
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # modules in the library
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/services)

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Custom generators
    config.generators do |g|
      g.test_framework :rspec
      g.helper_specs false
      g.controller_specs false
      g.view_specs false
      g.routing_specs true
      g.request_specs true
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    # Config MFCS Data Store
    config.mfcs = config_for(:mfcs)
  end
end
