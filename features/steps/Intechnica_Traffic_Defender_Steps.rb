Given(/^I can access the TrafficDefender test website$/) do
	in_session("1") do
		@traffic_defender = Trafficdefendersite.new
		@traffic_defender.traffic_defender_page.load
	end
end

Then(/^I can see the TrafficDefender test page$/) do
	set_session("1") do
		@traffic_defender.traffic_defender_page.assertPage
		page.execute_script "window.close();"
	end
end

Given(/^there is someone else already accessing the site$/) do
	in_session("2") do
		@traffic_defender2 = Trafficdefendersite.new
		@traffic_defender2.traffic_defender_page.load
	end
end

Then(/^I can see the TrafficDefender test queue page$/) do
	set_session("2") do
		@traffic_defender2.traffic_defender_queue_page.assertPage
		page.execute_script "window.close();"
	end
end

Given(/^I am on the TrafficDefender test queue page$/) do
	in_session("1") do
		@traffic_defender = Trafficdefendersite.new
		@traffic_defender.traffic_defender_page.load
	end

	in_session("2") do
		@traffic_defender2 = Trafficdefendersite.new
		@traffic_defender2.traffic_defender_page.load
	end
end

Then(/^I can see my position in the queue$/) do
	set_session("2") do
		@traffic_defender2.traffic_defender_queue_page.assertPosition
		page.execute_script "window.close();"
	end
end

When(/^someone else exits the browser$/) do
	set_session("1") do
		page.execute_script "window.close();"
	end
end

Then(/^I am re\-directed to the TrafficDefender test page$/) do
	set_session("2") do
		@traffic_defender2.traffic_defender_queue_page.wait_for_reload
		@traffic_defender2.traffic_defender_page.assertPage
	end
end