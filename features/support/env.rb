require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_selector = :css
  config.default_wait_time = 10
  config.app_host = "http://cleartrip.com"
  config.ignore_hidden_elements = false
end


#storing the browser name
browser_name = ENV['BROWSER']

if browser_name.nil? then
  raise "No browser was specified. Please re-run with the BROWSER option"
end

# set capybara default
case browser_name
when 'firefox'
  Capybara.default_driver = :selenium_firefox
when 'chrome'
  Capybara.default_driver = :selenium_chrome
else
  raise "Unsupported option specified for BROWSER"
end

# set driver name and capibilities
driver_name = "selenium_#{browser_name}";
caps = Selenium::WebDriver::Remote::Capabilities.send(browser_name)

Dir["test_site/*.rb"].sort.each { |file| load file }
Dir["test_site/pages/*.rb"].sort.each { |file| load file }
Dir["features/lib/*.rb"].sort.each { |file| load file }

$Browser = TestSite.new

Selenium::WebDriver::Chrome.driver_path="#{Dir.pwd}/chromedriver.exe"

if browser_name == 'firefox'
  Capybara.register_driver driver_name.to_sym do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    Capybara::Selenium::Driver.new(app,
                                   :browser => browser_name.to_sym,
                                   :profile => profile)
  end
else
  Capybara.register_driver driver_name.to_sym do |app|
    Capybara::Selenium::Driver.new(app,
                                   :browser => browser_name.to_sym,
                                   :desired_capabilities => caps)
  end
end

# Assertions settings
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
