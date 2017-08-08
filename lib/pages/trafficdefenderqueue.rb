class Pages::Trafficdefenderqueue < SitePrism::Page

	def assertPage
		if (page.has_content?("Holding Page") == false)
			throw "The page did not load properly. Check the URL and try again"
		end
	end

	def assertPosition
		if (page.has_content?("You are currently at position") == true)
			page.has_css?('div#queuePosition')
		else
			throw "I can't see your current position number"
		end
	end

	def wait_for_reload
		sleep(15)
	end

end