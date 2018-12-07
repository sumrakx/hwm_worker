require 'capybara'
require 'rollbar'
require 'config/secrets'
require 'selenium/webdriver'

Rollbar.configure do |config|
  config.access_token = SECRETS['rollbar']['token']
end
