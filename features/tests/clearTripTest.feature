@clearTrip
Feature: Clear Trip

# Number of Scenarios (s): 3

  Background: Launch the ClearTrip page
    Given I am on the page

    Scenario: Verify flights search results page
      When I search one way flights
      And I enter source city "Delhi" and destination city "Bangalore"
      And I enter "Flight" travel date
      And I click on "Search Flights" button
      Then I should see the Search Results Page

    Scenario: Verify hotels search results page
      When I click on "Hotels" link on page
      And I enter hotel location as "Chennai"
      And I enter "Hotel Checkin" travel date
      And I enter "Hotel Checkout" travel date
      And I click on "Search Hotels" button
      Then I should see the Search Results Page

    Scenario: SignIn page
      When I click on "Your trip" menu item
      And I click on "SignIn" button
      And I see the signIn content frame
      And I click on "SignIn Button" button
      Then I should see the Error message
