require 'selenium-webdriver'
require 'page-object'
require_relative 'pages/family_tree'

@wip
Given(/^I open the family tree questionnaire$/) do
  Family_Tree.open_family_tree_quesionnaire
  Family_Tree.verify_family_tree_title
end
@wip
Given(/^I see the welcome message$/) do
  Family_Tree.verify_welcome_title
end

Given(/^I see the "([^"]*)" question$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I answer "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I am redirected to the "([^"]*)" screen$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see the "([^"]*)" response$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I answered No to orphan question$/) do
  pending # Write code here that turns the phrase above into concrete actions
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
