Feature: family tree questionnaire
	As a family tree questionnaire user
	I want to classify my parents
	So that I can answer correct set of questions on a form

Background: 
	Given I open the family tree questionnaire
	And I see the welcome message


Scenario: orphan or state dependent - yes
	Given I see the "Were you an orphan" question
	When I answer "Yes"
	Then I am redirected to the "Orphaned or state dependent" screen
	And I see the "step 4" response


Scenario: orphan or state dependent - no
	Given I see the "Were you an orphan" question
	When I answer "No"
	Then I am redirected to the "Parental status" screen
	And I see the "parents still alive and married" question
	When I answer "Yes"
	Then I am redirected to the "Living married birth parents" screen


Scenario: parents alive and married - yes 
	Given I answered No to Were you an orphan question
	And I see the "parents still alive and married" question
	When I answer "Yes"
	Then I am redirected to the "Living married birth parents" screen
	And I see the "married birth mother and birth father" response


Scenario: parents alive and married - no
	Given I answered No to Were you an orphan question
	And I see the "parents still alive and married" question
	When I answer "No"
	Then I am redirected to the "Birth parents not married and alive" screen
	And I see the "divorced/separated or widowed" question


Scenario: Divorced or Separated
	Given I answered No to parents alive and married question
	And I see the "divorced/separated or widowed" question
	When I answer "Divorced/Separated"
	Then I am redirected to the "Primary parent - parents divorced/separated" screen
	And I see the "primary parent get remarried" question


Scenario: Divorced not remarried
	Given I answered Divorced to the divorced or widowed question
	Then I see the "remarried?" question
	When I answer "No"
	Then I see the "primary divorced/separated single parent" response


Scenario: Divorced and remarried
	Given I answered Divorced to the divorced or widowed question
	Then I see the "remarried?" question
	When I answer "Yes"
	Then I see the "primary divorced/separated parent & step parent" response


Scenario: Widowed
	Given I answered No to parents alive and married question
	And I see the "divorced/separated or widowed" question
	When I answer "Widowed"
	Then I am redirected to the "Widowed parent" screen
	And I see the "widowed parent get remarried?" question


Scenario: Widowed not remarried
	Given I answered Widowed to the divorced or widowed question
	Then I see the "widowed parent get remarried?" question
	When I answer "No"
	Then I see the "single widowed parent" response


Scenario: Widowed and remarried
	Given I answered Widowed to the divorced or widowed question
	Then I see the "widowed parent get remarried?" question
	When I answer "Yes"
	Then I see the "widowed parent and your step parent" response