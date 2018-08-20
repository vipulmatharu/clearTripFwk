class HomePage < SitePrism::Page

  element :source_city, "#FromTag"
  element :one_way, "#OneWay"
  element :destination_city, "#ToTag"
  element :date_picker, "#DepartDate"
  element :search_btn, "#SearchBtn"
  element :search_results, ".searchSummary strong.truncate"
  element :hotel_link, ".productNav [href='/hotels']"
  element :hotel_location, "#Tags"
  element :hotel_checkin, ".checkin_date"
  element :hotel_checkout, ".checkout_date"
  element :search_hotel, "#SearchHotelsButton"
  element :your_trip, ".listMenuContainer #userAccountLink"
  element :sign_in, "#SignIn"
  element :sign_in_button, "#signInButton"
  element :signin_content, ".Container"
  element :signin_error_msg, ".errors"
end
