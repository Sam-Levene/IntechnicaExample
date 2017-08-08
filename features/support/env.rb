require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "active_support"
require "rspec"

Selenium::WebDriver.for :chrome, driver_path: '/usr/bin/chromedriver'

Capybara.configure do |config|
  config.run_server = false #To ensure a Rack server does not start
  config.ignore_hidden_elements = false #to ensure that all hidden elements on a page are recorded/available
  config.default_max_wait_time= 10 #wait time for asynchronus processes to finsh
  config.default_driver = :selenium_chrome #Default browser - input :selenium_chrome to use chrome browser as stated in the driver registration below
  config.match = :prefer_exact #this setting is to ensure Capybara has specific matching rather than fuzzy logic
end

ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

Capybara.register_driver :selenium_chrome do |app| # Registration of chrome driver
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {
        'args' => [ "--disable-extensions" ]
      }
    ))
end