require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/family_tree'
#require_relative 'pages/parental_status'


Given(/^I open the family tree questionnaire$/) do
  Family_Tree.open_family_tree_quesionnaire
  Family_Tree.verify_family_tree_title
end

Given(/^I see the welcome message$/) do
  Family_Tree.verify_welcome_title
end

Given(/^I see the "([^"]*)" question$/) do |question|
  Family_Tree.verify_question(question)
end

When(/^I answer "([^"]*)"$/) do |response|
  Family_Tree.click_response(response)
end

Then(/^I am redirected to the "([^"]*)" screen$/) do |screen_title|
  Family_Tree.verify_screen(screen_title)
end

Then(/^I see the "([^"]*)" response$/) do |response|
  Family_Tree.verify_response(response)
end


## Compound steps

Given(/^I answered No to Were you an orphan question$/) do 
    steps %{
      Given I see the "Were you an orphan" question
      When I answer "No"
      Then I am redirected to the "Parental status" screen
  }
end

Given(/^I answered No to parents alive and married question$/) do 
    steps %{
      Given I answered No to Were you an orphan question
      And I see the "parents still alive and married" question
      When I answer "No"
      And I am redirected to the "Birth parents not married and alive" screen
  }
end

Given (/^I answered Divorced to the divorced or widowed question$/) do
  steps %{
    Given I answered No to parents alive and married question
    And I see the "divorced/separated or widowed" question
    When I answer "Divorced/Separated"
    Then I am redirected to the "Primary parent - parents divorced/separated" screen
    }
end

Given(/^I answered Widowed to the divorced or widowed question$/) do
  steps %{
    Given I answered No to parents alive and married question
    And I see the "divorced/separated or widowed" question
    When I answer "Widowed"
    Then I am redirected to the "Widowed parent" screen
  }
end


