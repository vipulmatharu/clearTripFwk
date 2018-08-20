And(/^I press the enter key$/) do
  page.driver.browser.action.send_keys(:return).perform
end

And(/^I click on "([^"]*)" button$/) do |choice|
  case choice
    when "Search Flights"
      $Browser.home_page.search_btn.click
    when "Search Hotels"
      $Browser.home_page.search_hotel.click
    when "SignIn"
      $Browser.home_page.sign_in.click
    when "SignIn Button"
      $Browser.home_page.sign_in_button.click
    else
      raise "Invalid button passed"
  end
end
