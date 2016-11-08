require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/family_tree'


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

When(/^I answer "([^"]*)"$/) do |answer|
  Family_Tree.click_response(answer)
end

Then(/^I am redirected to the "([^"]*)" screen$/) do |screen_title|
  Family_Tree.verify_screen(screen_title)
end

Then(/^I see the "([^"]*)" response$/) do |response|
  Family_Tree.verify_response(response)
end

Given(/^I answered "([^"]*)" to "([^"]*)" question$/) do |response, question|
    Family_Tree.node_id(question)
    screen_title = @screen_title
    steps %{
      And I see the "#{question}" question
      Then I answer "#{response}"
      And I am redirected to the "#{screen_title}" screen
  }
end

Given(/^I answered "([^"]*)" to parents alive and married question$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I answered "([^"]*)" to the divorced or widowed question$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I am redirected to the "([^"]*)" response$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
