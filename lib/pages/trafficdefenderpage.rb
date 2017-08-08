class Pages::Trafficdefenderpage < SitePrism::Page

	set_url "http://34.250.183.69/"
	set_url_matcher /34.250.183.69/

	def assertPage
		if (page.has_content?("Hello! I am the TD Perf Test Server 1") == false)
			throw "The page did not load properly. Check the URL and try again"
		end
	end

end