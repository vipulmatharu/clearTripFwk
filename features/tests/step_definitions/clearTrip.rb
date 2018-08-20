When(/^I am on the page$/) do
  visit "/"
  Capybara.page.driver.browser.manage.window.maximize
end

And(/^I search one way flights$/) do
  $Browser.home_page.one_way.click
end

When(/^I enter source city "([^"]*)" and destination city "([^"]*)"$/) do |source, destination|
  $Browser.home_page.source_city.set source
  source = 1
  GlobalFunctions.dropDownExist(source)
  $Browser.home_page.destination_city.set destination
  destination = 2
  GlobalFunctions.dropDownExist(destination)
end

And(/^I enter "([^"]*)" travel date$/) do |choice|
  case choice
  when "Flight"
    $Browser.home_page.date_picker.click
  when "Hotel Checkin"
    $Browser.home_page.hotel_checkin.click
  when "Hotel Checkout"
    $Browser.home_page.hotel_checkout.click
  else
    raise "Invalid option passed"
  end
  GlobalFunctions.waitFor(1)
  page.driver.browser.action.send_keys(:down).perform
  step 'I press the enter key'
end

And(/^I should see the Search Results Page$/) do
   expect(page).to have_css(".#{$Browser.home_page.search_results['class']}")
end

And(/^I click on "Hotels" link on page$/) do
   $Browser.home_page.hotel_link.click
end

When(/^I enter hotel location as "([^"]*)"$/) do |destination|
  $Browser.home_page.hotel_location.set destination
  GlobalFunctions.waitFor(3)
  step 'I press the enter key'
end

And(/^I click on "Your trip" menu item$/) do
  $Browser.home_page.your_trip.click
end

And(/^I see the signIn content frame$/) do
  GlobalFunctions.waitFor(3)
  page.driver.browser.switch_to.frame "modal_window"
  expect(page).to have_css(".#{$Browser.home_page.signin_content['class']}")
end

And(/^I should see the Error message$/) do
    expect(page).to have_css(".#{$Browser.home_page.signin_error_msg['class']}")
end
