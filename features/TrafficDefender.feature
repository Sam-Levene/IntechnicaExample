Feature: Accessing the TrafficDefender test website

	As a user
	I want to access the TrafficDefender test website
	So that I can check its functionailty

	@Scenario_01
	Scenario: Single user accessing the TrafficDefender test website
		Given I can access the TrafficDefender test website
		Then I can see the TrafficDefender test page

	@Scenario_02
	Scenario: Multiple users accessing the TrafficDefender test website and getting the queue page
		Given I can access the TrafficDefender test website
		And there is someone else already accessing the site
		Then I can see the TrafficDefender test queue page

	@Scenario_03
	Scenario: Checking the queue page position in queue
		Given I am on the TrafficDefender test queue page
		Then I can see my position in the queue

	@Scenario_04
	Scenario: Multiple users accessing the TrafficDefender test website from the queue page when space is available
		Given I am on the TrafficDefender test queue page
		And there is someone else already accessing the site
		When someone else exits the browser
		Then I am re-directed to the TrafficDefender test page