# clearTripFwk

Steps to execute the Test

- Install Ruby
- bundle Install
- cucumber -t tagname browser=chrome/firefox

You can run tests on both chrome as well as on firefox browser.

--The gherkin steps which are in quotes (""). These are dynamic. Please find below example:
    And I enter source city "Delhi" and destination city "Bangalore"
--In above step you can pass any valid city names.


Gems annd its uses:
  gem 'capybara'            -->  it is library for acceptance tests.
  gem 'capybara/cucumber'   --> it is a tool and provide BDD.
  gem 'selenium-webdriver'  --> to interact with browser.
  gem 'site_prism'          --> Page object Model.
  gem 'rspec'               --> Assertions library.

Reports:
  Tests executed on chrome browser. Find Result in clearTrip_chrome.html report.
  Tests executed on firefox browser. Find Result in clearTrip_firefox.html report
