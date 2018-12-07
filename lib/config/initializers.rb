require 'capybara'
require 'rollbar'
require 'config/secrets'
require 'selenium/webdriver'

Rollbar.configure do |config|
  config.access_token = SECRETS['rollbar']['token']
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {args: %w[headless disable-gpu no-sandbox]}
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome
